/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yrabby <yrabby@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/07/13 16:55:04 by yrabby            #+#    #+#             */
/*   Updated: 2022/07/13 19:16:26 by yrabby           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "mlx.h"
#include "define.h"

int main(int ac, char **av)
{
    void    *mlx;
    void    *win;
    int i = 10;

    mlx = mlx_init();

    win = mlx_new_window(mlx, 100, 100, "yesssss");

    while (90 > i)
    {
        mlx_pixel_put(mlx, win, 100 - i, i, 0xFFFFFF);
        mlx_pixel_put(mlx, win, i, i, 0xFFFFFF);
        mlx_pixel_put(mlx, win, 0, i, 0xFFFFFF);
        mlx_pixel_put(mlx, win, 90, i, 0xFFFFFF);
        mlx_pixel_put(mlx, win, i, 0, 0xFFFFFF);
        ++i;
    }
    mlx_loop(mlx);
// int	mlx_clear_window(void *mlx_ptr, void *win_ptr);
// int	mlx_pixel_put(void *mlx_ptr, void *win_ptr, int x, int y, int color);

    
    return (SUCCESS);
}
