Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75F8197C63
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Mar 2020 15:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CAF89C7F;
	Mon, 30 Mar 2020 13:03:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D0089C7F
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Mar 2020 13:03:01 +0000 (UTC)
Date: Mon, 30 Mar 2020 13:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1585573378;
 bh=v48RJMmMnHtc4gJbDOKKKrtuB6yTrvO3drNRAouZ4js=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=RZ7HaYwB5FO7Rx0x6ukJqXshllze5JNHMYEHk3oFEXhRIiYzgxveI8j+td8uEw5il
 aoYByiqSyEpZlkVaGyOcwuFHR2pZn4+hFaG5sw3ZtEKHMudTtlPKTNTrGmS2fWMwca
 YoHAnYcayFduudiF1mjVlXXb6ZfveE+Lno4PhcsA=
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/amd/display: add basic atomic check for cursor plane
Message-ID: <7EkixViMkOWZ8AEOpjSPCtfus4Fq2LWBmsk71_0nAC00BVKDIg7iao_0I2PIQp9Z3_jrQ5cglhuYKkq5CQnuLRunzg4pirlkY6hH3At1gww=@emersion.fr>
In-Reply-To: <83db678a-a5d2-cf64-65f0-8fece62b2fbd@amd.com>
References: <67AgM0yylniATabNxt8ct_5KATDTAwvscoDJBJxA3cm0vb0LJvyUM9VAX4r6Ib5Vxykoy9AN0G1uyZO8q00_RvTwmaimmGNQ3hZYoWKXZAo=@emersion.fr>
 <83db678a-a5d2-cf64-65f0-8fece62b2fbd@amd.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Roman Gilg <subdiff@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Monday, March 30, 2020 2:59 PM, Kazlauskas, Nicholas <nicholas.kazlauskas@amd.com> wrote:

> We've been doing these checks for position before but I don't think we
> really need them. DC should be disabling the cursor when we ask for a
> position completely off the screen.
>
> I think that's better than rejecting the commit entirely at least.

I agree DC should be disabling the cursor in this case, however that's
not yet implemented right? I think implementing this feature is
orthogonal and should be done in a separate patch.

This patch simply copies over the cursor checks in the atomic check
function.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
