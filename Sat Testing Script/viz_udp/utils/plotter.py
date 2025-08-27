import matplotlib.pyplot as plt
import os
from utils.config import colors, markers, linestyles, DPI, SAVE_FORMATS, bar_width as global_bar_width , figsize as global_figsize, title_req
import seaborn as sns
import pandas as pd

# Function to save the plot in different formats
def save_plot(fig, filename, folder):
    """Save a plot in multiple formats."""
    os.makedirs(folder, exist_ok=True)
    for fmt in SAVE_FORMATS:
        fig.savefig(f"{folder}/{filename}.{fmt}", dpi=DPI, bbox_inches='tight')


# def plot_matplotlib_graph(paths, ycolumn, title, xlabel, ylabel, filename, graph_directory):
#     """Plot a graph from Siftr log files."""
#     sns.set_style("darkgrid")
#     fig, ax = plt.subplots(figsize=global_figsize)

#     # Enumerate with consistent colors
#     for i, (path_label, path_df) in enumerate(paths.items()):
#         ax.plot(
#             path_df['Time'], 
#             path_df[ycolumn], 
#             label=path_label,
#             color=colors[i % len(colors)]  # cycle colors if more lines than colors
#         )

#     ax.set(title=title if title_req else "", xlabel=xlabel, ylabel=ylabel)
#     ax.legend()
#     ax.grid(True)
    
#     plt.tight_layout()
#     save_plot(fig, filename, graph_directory)
#     plt.show()
#     plt.close(fig)

# def plot_cdf_matplotlib(data_dict, xlabel, ylabel, title, filename, folder):
#     """
#     Plot CDFs for multiple datasets using matplotlib.
#     """
#     fig, ax = plt.subplots(figsize=global_figsize)
    
#     for i, (label, data) in enumerate(data_dict.items()):
#         sorted_data = np.sort(data)
#         cdf = np.arange(1, len(sorted_data)+1) / len(sorted_data)
#         ax.plot(
#             sorted_data, 
#             cdf, 
#             label=label,
#             color=colors[i % len(colors)]  # same palette as plot_matplotlib_graph
#         )
    
#     ax.set(title=title if title_req else "", xlabel=xlabel, ylabel=ylabel)
#     ax.grid(True)
#     ax.legend()
    
#     plt.tight_layout()
#     save_plot(fig, filename, folder)
#     plt.show()
#     plt.close(fig)


def plot_matplotlib_graph(paths, ycolumn, title, xlabel, ylabel, filename, graph_directory):
    """Plot a graph from Siftr log files."""
    sns.set_style("darkgrid")
    fig, ax = plt.subplots(figsize=global_figsize)

    
    for i, (path_label, path_df) in enumerate(paths.items()):
        # print("i:,",i)
        # print("colors[i]",colors[i])
        # print("path_label",path_label)
        
        # ax.plot(path_df['Time'], path_df[ycolumn], label=path_label, color=colors[i],marker=markers[i],linestyle=linestyles[i])
        ax.plot(path_df['Time'], path_df[ycolumn], label=path_label)

    # ax.set_ylim(0, 10)  # Set y-axis from 0 to 100
    if not title_req:
        title = ""

    # Set plot properties
    ax.set(title=title, xlabel=xlabel, ylabel=ylabel)
    ax.legend()
    ax.grid(True)
    
    # Tight layout and save the plot
    plt.tight_layout()
    print("folder save", graph_directory)
    save_plot(fig, filename, graph_directory)
    plt.show()
    plt.close(fig)


def plot_cdf_matplotlib(data_dict, xlabel, ylabel, title, filename, folder):
    """
    Plot CDFs for multiple datasets using matplotlib.
    
    data_dict: dict of label -> 1D array-like data
    """
    fig, ax = plt.subplots(figsize=global_figsize)
    
    for label, data in data_dict.items():
        sorted_data = np.sort(data)
        cdf = np.arange(1, len(sorted_data)+1) / len(sorted_data)
        ax.plot(sorted_data, cdf, label=label)
    
    if not title_req:
        title = ""
        
    ax.set(title=title, xlabel=xlabel, ylabel=ylabel)
    ax.grid(True)
    ax.legend()
    
    plt.tight_layout()
    save_plot(fig, filename, folder)
    plt.show()
    plt.close(fig)


import plotly.graph_objects as go
import numpy as np
import os

def plot_cdf_plotly(data_dict, xlabel, ylabel, title, filename, folder):
    """
    Plot CDFs for multiple datasets using plotly.
    
    data_dict: dict of label -> 1D array-like data
    """
    fig = go.Figure()
    
    for label, data in data_dict.items():
        sorted_data = np.sort(data)
        cdf = np.arange(1, len(sorted_data)+1) / len(sorted_data)
        fig.add_trace(go.Scatter(x=sorted_data, y=cdf, mode='lines', name=label))
    
    fig.update_layout(
        title=title if title_req else "",
        xaxis_title=xlabel,
        yaxis_title=ylabel,
        template="plotly_white",
        legend_title_text="Legend"
    )
    
    os.makedirs(folder, exist_ok=True)
    fig.write_html(f"{folder}/{filename}.html")
    fig.write_image(f"{folder}/{filename}.png", scale=2)
    fig.show()




# def plot_boxplot_seaborn(dataframe, column, groupby=None, title="", xlabel="", ylabel="", filename="", folder=""):
#     """
#     Plot a boxplot of a column from a DataFrame with optional grouping.
#     Each group in `groupby` will have a different color.
    
#     dataframe: pandas DataFrame
#     column: column name to plot the boxplot for
#     groupby: (optional) column name to group data by (e.g., categories)
#     """
#     sns.set_style("whitegrid")
#     fig, ax = plt.subplots(figsize=(6, 4))
    
#     if groupby:
#         # Get unique groups and generate a color palette for them
#         groups = dataframe[groupby].unique()
#         palette = sns.color_palette("Set2", len(groups))  # or any other seaborn palette
#         sns.boxplot(data=dataframe, x=groupby, y=column, ax=ax, palette=palette,showfliers=False,whis=1.0)
#     else:
#         sns.boxplot(data=dataframe, y=column, ax=ax,showfliers=False,whis=1.0)
    
#     if not title_req:
#         title = ""
    
#     ax.set(title=title, xlabel=xlabel, ylabel=ylabel)
#     ax.tick_params(axis='x', rotation=30)
    
#     plt.tight_layout()
#     save_plot(fig, filename, folder)
#     plt.show()
#     plt.close(fig)


import seaborn as sns
import matplotlib.pyplot as plt

def plot_boxplot_seaborn(dataframe, column, groupby=None, title="", xlabel="", ylabel="", filename="", folder=""):
    """
    Plot a boxplot of a column from a DataFrame with optional grouping.
    Each group in `groupby` will have a different color.
    
    dataframe: pandas DataFrame
    column: column name to plot the boxplot for
    groupby: (optional) column name to group data by (e.g., categories)
    """
    sns.set_style("whitegrid")
    fig, ax = plt.subplots(figsize=(6, 4))
    
    custom_palette = ["skyblue", "lightgreen", "pink", "orange"]

    if groupby:
        # Generate boxplot with custom colors
        sns.boxplot(
            data=dataframe,
            x=groupby,
            y=column,
            ax=ax,
            palette=custom_palette,
            showfliers=False,
            whis=1.0
        )
    else:
        sns.boxplot(
            data=dataframe,
            y=column,
            ax=ax,
            color="skyblue",
            showfliers=False,
            whis=1.0
        )
    
    if not title_req:
        title = ""
        xlabel = ""
    ax.set(title=title, xlabel=xlabel, ylabel=ylabel)
    ax.tick_params(axis='x', rotation=30)
    
    plt.tight_layout()
    save_plot(fig, filename, folder)
    plt.show()
    plt.close(fig)




import plotly.graph_objects as go

def save_plotly_fig(fig, filename, folder):
    """Save a plotly figure as HTML and PNG."""
    os.makedirs(folder, exist_ok=True)
    # Save as HTML (interactive)
    fig.write_html(f"{folder}/{filename}.html")
    # Save as static PNG
    fig.write_image(f"{folder}/{filename}.png", scale=2)  # scale=2 for higher DPI


def plot_plotly_graph(paths, ycolumn, title, xlabel, ylabel, filename, graph_directory):
    """Plot graph using plotly."""
    fig = go.Figure()

    for path_label, path_df in paths.items():
        fig.add_trace(go.Scatter(
            x=path_df['Time'],
            y=path_df[ycolumn],
            mode='lines+markers',
            name=path_label
        ))

    fig.update_layout(
        title=title if title_req else "",
        xaxis_title=xlabel,
        yaxis_title=ylabel,
        template="plotly_white",
        legend_title_text="Legend"
    )

    # save_plotly_fig(fig, filename, graph_directory)
    fig.show()

