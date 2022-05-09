Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E92E51FEF0
	for <lists+amd-gfx@lfdr.de>; Mon,  9 May 2022 16:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F61210F1CD;
	Mon,  9 May 2022 14:00:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A762110F1CD
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 May 2022 14:00:11 +0000 (UTC)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0DDF961E6478B;
 Mon,  9 May 2022 16:00:10 +0200 (CEST)
Message-ID: <f284dad0-9a9e-0edb-54df-db97b58451e9@molgen.mpg.de>
Date: Mon, 9 May 2022 16:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: How are the DC patches tested? (was: [PATCH 00/15] DC Patches May 9, 
 2022)
To: Daniel Wheeler <Daniel.Wheeler@amd.com>
References: <20220506154214.3438665-1-stylon.wang@amd.com>
 <DM6PR12MB352902B7FE179953EBBD474F9CC69@DM6PR12MB3529.namprd12.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <DM6PR12MB352902B7FE179953EBBD474F9CC69@DM6PR12MB3529.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Chao-kai Wang <Stylon.Wang@amd.com>, Sun Peng Li <Sunpeng.Li@amd.com>,
 Harry Wentland <Harry.Wentland@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <Roman.Li@amd.com>,
 amd-gfx@lists.freedesktop.org, Solomon Chiu <Solomon.Chiu@amd.com>,
 Aurabindo Pillai <Aurabindo.Pillai@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Agustin Gutierrez <Agustin.Gutierrez@amd.com>,
 Pavle Kotarac <Pavle.Kotarac@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[Sorry for the incomplete first message.]

Dear Daniel,


Am 09.05.22 um 15:14 schrieb Wheeler, Daniel:

[…]

> This week this patchset was tested on the following systems:
> 
> Lenovo Thinkpad T14s Gen2 with AMD Ryzen 5 5650U, with the following
> display types: eDP 1080p 60hz, 4k 60hz  (via USB-C to DP/HDMI), 1440p
> 144hz (via USB-C to DP/HDMI), 1680*1050 60hz (via USB-C to DP and
> then DP to DVI/VGA)
> 
> Sapphire Pulse RX5700XT with the following display types: 4k 60hz
> (via DP/HDMI), 1440p 144hz (via DP/HDMI), 1680*1050 60hz (via DP to
> DVI/VGA)
> 
> Reference AMD RX6800 with the following display types: 4k 60hz  (via
> DP/HDMI and USB-C to DP/HDMI), 1440p 144hz (via USB-C to DP/HDMI and
> USB-C to DP/HDMI), 1680*1050 60hz (via DP to DVI/VGA)
> 
> Included testing using a Startech DP 1.4 MST hub at 2x 4k 60hz and
> DSC via USB-C to DP DSC Hub with 3x 4k 60hz.
> 
> Tested on Ubuntu 22.04 with Kernel Version 5.16, and ChromeOS

I am curious, what this means exactly? You clone the Ubuntu Linux 5.16 
kernel source, and then apply your patches on top? (Do they even apply?)

The same for Chrome OS. Do you use Chrome OS Flex [1] with the systems 
you listed? If not, what Google Chromebooks/-boxes did you test with? 
The Linux kernel version is also tied for a device and Chrome OS 
release. Please mention those too.

Is it documented somewhere, what tests you run exactly?


Kind regards,

Paul


[1]: https://chromeenterprise.google/os/chromeosflex/
