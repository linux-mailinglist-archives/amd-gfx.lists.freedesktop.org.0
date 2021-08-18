Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E64E03F01FA
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Aug 2021 12:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A7F6E52A;
	Wed, 18 Aug 2021 10:48:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DEE6E52A
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Aug 2021 10:48:53 +0000 (UTC)
Date: Wed, 18 Aug 2021 10:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1629283730;
 bh=Xm/qC/EsECXP+wbkovMcaJ4ROJVnhmUJKc/8yNTC4ak=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Z5Nky+Nxo0/StQQVfdHAwfYqzQ61FXxU3F3fjjj1/N8imtvxcAn+etMMMQrUWn8GW
 5ggoo+Vl3q5xSugrITJwLPUl4dhyuwJAPPIXAY11/jrstZEKfJWVM0d0suO/l1GZBd
 on8LWeti7RARyQitLOAxyaJm0dHxLmdaEBUftsTAg+WQPnsqwZtDw68bqAbUa88gR9
 jmA1QPlrxqFnPm4m+9uhygKXWU7Ck3n8/Gr/4P2M1z8n0embyJYQnAzSRaTBetRK1s
 Mjcw5H1VQFXrp7PMWAovqwDrvUVF6kGLUOjmd+HNs369ZyGmj+I252oPEpZPvJowN8
 CbRnOgw71ClEw==
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: amd-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Hersen Wu <hersenxs.wu@amd.com>, Harry Wentland <Harry.Wentland@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Louis Li <Ching-shih.Li@amd.com>
Subject: Re: [PATCH v2] drm/amd/display: Fix two cursor duplication when using
 overlay
Message-ID: <SrcUnUUGJquVgjp9P79uV8sv6s-kMHG4wp0S3b4Nh9ksi29EIOye5edofuXkDLRvGfvkkRpQZ9JM7MNqew2B3kFUhaxsonDRXprkAYXaQUo=@emersion.fr>
In-Reply-To: <20210414000604.3273048-1-Rodrigo.Siqueira@amd.com>
References: <20210414000604.3273048-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hm. This patch causes a regression for me. I was using primary + overlay
not covering the whole primary plane + cursor before. This patch breaks it.

This patch makes the overlay plane very useless for me, because the primary
plane is always under the overlay plane.

> Basically, we cannot draw the cursor at the same size and position on
> two separated pipes since it uses extra bandwidth and DML only run
> with one cursor.

I don't understand this limitation. Why would it be necessary to draw the
cursor on two separate pipes? Isn't it only necessary to draw it once on
the overlay pipe, and not draw it on the primary pipe?
