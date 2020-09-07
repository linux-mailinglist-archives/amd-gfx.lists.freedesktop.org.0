Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D625FC1C
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Sep 2020 16:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D86A6E48C;
	Mon,  7 Sep 2020 14:30:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7486E463
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Sep 2020 14:23:46 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 901233B0658
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Sep 2020 14:20:46 +0000 (UTC)
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net
 [82.255.60.242]) (Authenticated sender: hadess@hadess.net)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E1EAEFF809
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Sep 2020 14:20:23 +0000 (UTC)
Message-ID: <36ccfc64de628c060a736b8e05ae076246b686fc.camel@hadess.net>
Subject: Power-saving/performance toggles for amdgpu
From: Bastien Nocera <hadess@hadess.net>
To: amd-gfx@lists.freedesktop.org
Date: Mon, 07 Sep 2020 16:20:23 +0200
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Sep 2020 14:30:55 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hey,

I'm currently working on a daemon that allows a UI that will eventually
look like the power mode section in this mockup:
https://gitlab.gnome.org/Teams/Design/settings-mockups/-/blob/master/power/power.png

The daemon:
https://gitlab.freedesktop.org/hadess/power-profiles-daemon
The UI:
https://gitlab.gnome.org/GNOME/gnome-control-center/-/merge_requests/816

It might be interesting, on some systems, to nudge the GPU drivers
in the direction wanted by the user, either enabling aggressive power-
saving or allowing more power to be used for better temporary
performance.

I was wondering whether the tweaks
in /sys/class/drm/card*/device/power_profile
and /sys/class/drm/card*/device/power_method were things that this
daemon could and should tweak, or whether it was present solely for
debug purposes and shouldn't be needed even when high performance or
power-saving is wanted:
https://gitlab.freedesktop.org/hadess/power-profiles-daemon/-/issues/3

Thanks in advance!

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
