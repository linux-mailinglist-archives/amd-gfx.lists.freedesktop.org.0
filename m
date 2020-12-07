Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C28B2D1419
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Dec 2020 15:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6DA6E863;
	Mon,  7 Dec 2020 14:53:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CA76E863
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Dec 2020 14:53:41 +0000 (UTC)
Date: Mon, 07 Dec 2020 14:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607352819;
 bh=FXJlGk7UyH6qqIbQbSseDos5ORdiHoEPTzmlGFgqpVI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=PQRZ5SGK0TU1R42fTm2/vXHLXilHAele6T6BezzxcM+IH+HOJrfXZx873Y2FTXHjk
 sKsMi8D9vsxqCGLyOy9rAspbUJbI3r6I3qVCm2RTNh4GFGxRgazk+rBE5WF/NjjoMm
 GfZAB7iqCS0DCsbhTSxM+zpXeqHXHhX+lS1LVmm8wyjXWVglpzFtaMNQHEH1kaVcW3
 X9ZNSQQJ4Wb8ly9/Zx964dqRjY6uXfy11uTbaWaIbLb7MWN79cCvNJNTVvx51aFwfe
 +civQ/LIJEMob8kXNCjiTwSs0PjBOVRgrgK9s6wTziaTwiIBuc+RiW5uSNnv0koakk
 FeOjPbXaYeH5w==
To: Dan Carpenter <dan.carpenter@oracle.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [bug report] drm/amd/display: use FB pitch to fill
 dc_cursor_attributes
Message-ID: <yH-pfID7WsjnSRJLbFhmhDjbNS-jDo5oMNFmAKlbXjnrC3ySx584MAya2-VjK8jszGeglKY9pbr-M3d1j_9dTjXCG4hxRePwZc0cJ-P3am0=@emersion.fr>
In-Reply-To: <X85BcS43BIlg6GRx@mwanda>
References: <X85BcS43BIlg6GRx@mwanda>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

On Monday, December 7th, 2020 at 3:51 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The patch adds some new unchecked dereferences.

The `if (!position.enable)` check above should ensure the dereference
isn't unchecked.

Simon
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
