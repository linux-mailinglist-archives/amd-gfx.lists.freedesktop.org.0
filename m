Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0924255CF
	for <lists+amd-gfx@lfdr.de>; Thu,  7 Oct 2021 16:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4BC6F886;
	Thu,  7 Oct 2021 14:52:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F5E6F886
 for <amd-gfx@lists.freedesktop.org>; Thu,  7 Oct 2021 14:52:29 +0000 (UTC)
Date: Thu, 07 Oct 2021 14:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1633618347;
 bh=+gIOteViXdYvox5aiR3Z14PIYT653tkbpZPNaFnUvik=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=WOfeo/4/ugqHP4nGDwe1lglZAn2N7OYSu+XDyXSUsu8IAlkSa5sfFvoopZcJcs9/u
 VSakeZS3FAQ/7R66CvSDPB5SloqZWO/CWl/NXBzepeweJ1P8kzu2AFMTckLbL0c1Oj
 u6Ol1xB+uKd+R4PvsQx1x2Pxe1NNQuNHBToRVBBmznqdC5xgi6MkDIqSf8F6of/VDi
 t7PKJWS0P8CsV/tbDncx5XEPTN+tJkj75e8A2TFANH/CNBfKhRJCRb2JEbajSzFWP4
 chZLx+J1XvzVesAq5R2CM5T+p3/TskZpJ3k9Pnwkrm8TW9FJq64kmKp8VEbx+OXknL
 P4ESryZ97MEDQ==
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v4 2/2] amd/display: only require overlay plane to cover
 whole CRTC on ChromeOS
Message-ID: <MMPjMlSgVA8CA8hvNljME_QHmf4kERAyHjfgj-5K5p_0HIpnFHFYgqFQvRgkJRziBEgRN-UnUIqD4b2N5_bprrVnGxcYMXfg5aEWevTiDZ0=@emersion.fr>
In-Reply-To: <a0999a42-1e0a-0d6c-af89-f8d52d9c445e@amd.com>
References: <20211006140558.254349-1-contact@emersion.fr>
 <20211006140558.254349-2-contact@emersion.fr>
 <a0999a42-1e0a-0d6c-af89-f8d52d9c445e@amd.com>
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

Thanks for the review!
