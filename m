Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCA542DE38
	for <lists+amd-gfx@lfdr.de>; Thu, 14 Oct 2021 17:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032B96E159;
	Thu, 14 Oct 2021 15:34:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9DA6E159
 for <amd-gfx@lists.freedesktop.org>; Thu, 14 Oct 2021 15:34:43 +0000 (UTC)
Date: Thu, 14 Oct 2021 15:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634225680;
 bh=SWRkWqFNF33bCX8lTsuTqPTTgfLJmLdUgUpB7MMXNH4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=PQgiY9bfMvrA7A9sl6BF5GnZk3O881IYCZJ4289Ui9Qd/s/ERcyoC+G5rQxsR3NJ9
 9r/C37vFv3LSe7z5zupv8lmc7wHn7b/8MoJrATLzdFwudoMHStqYJxXcH+bPapMfF/
 ipHvyKlaMnnRv1UoENDeDq6ydoSuDd2IHZ3dwtvxkbmxPHxr75q4ns8nVX9MEjqZCu
 QeUxs4xAnPJto2OfDnNQoA1P7UR528XUASEUQLu86zngjDI3rQz9j5RivZlBXce1rT
 M6BhlYJ4r5eXqYT/WA7uD8Z3QuRny2kas+vameqQDwDpD8T2YO+6csVHYe+HQnwS6D
 NOYGy7lsvANPg==
To: Alex Deucher <alexdeucher@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v5] amd/display: only require overlay plane to cover whole
 CRTC on ChromeOS
Message-ID: <8hIUwAg6MWl_TGUBsxm4YfxY_iwmJDGAAk85P3xL69-QU5oGlDFqtyByYYRvzRBpc46mfSDOexkypyS46bm-GdrTzWu-TEqi5RCiRTRNrXE=@emersion.fr>
In-Reply-To: <CADnq5_PaWhieZjz_OrLUhx75erV8A+GVkU5FhPOiDfDgscyXvw@mail.gmail.com>
References: <20211011151609.452132-1-contact@emersion.fr>
 <44154452-aa21-3f08-ffe8-e68fb8036271@amd.com>
 <CADnq5_M-13Sf1g4cw0Qt=qps72GEweZM-SrhQ9obLRsVr8_zfQ@mail.gmail.com>
 <f7f76c65-8e7e-67fc-414b-761702a97fe3@amd.com>
 <CADnq5_PaWhieZjz_OrLUhx75erV8A+GVkU5FhPOiDfDgscyXvw@mail.gmail.com>
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

On Tuesday, October 12th, 2021 at 23:03, Alex Deucher <alexdeucher@gmail.co=
m> wrote:

> > > @Harry Wentland, @Simon Ser Do you have a preference on whether we
> > > apply this patch or revert ddab8bd788f5? I'm fine with either.

I'd prefer to revert because (1) the ChromeOS team seems to be okay with th=
at
(2) they can remove it more easily once they have fixed their userspace and
(3) this avoids adding workarounds in the kernel.

Will send a patch for this soon!
