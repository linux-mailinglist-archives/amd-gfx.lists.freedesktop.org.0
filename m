Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7E1216E72
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Jul 2020 16:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB5D6E0BA;
	Tue,  7 Jul 2020 14:15:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394546E0BA
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jul 2020 14:15:00 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id g75so43432250wme.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 Jul 2020 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NI3HALMe9VoPPwpdY2ibEtaa7vpbSYNUdSX7WB9BX6c=;
 b=l4h/OkNa5o1TcpVD3ZylxLjInzSSSKVEaZbD2HEVRaZnMKWpVM8N7M5ULy32tENjvk
 1bgkv1FPQO1QPIar3KE4K8R+jabjFslW7j7NeStUPI/i+zLV1E1sNBIvnU3ZGF+X/hEg
 0YeYppq0U1sUmKk6n94ZmN/E7Tv86f5KMnsS5ErXJfo6kgIMFsu887T1ZwXTFTw7nUoW
 m0Lu2Th3gHzfvX3MRzJ2LL5XlbzsNxM42ccQy/lCN5de5yk8ODqmxAvnnRd/3PWC1zJK
 fgV4hzZGEEd7eZCmn1wKvYQR3bqW7IYM0hWYcC3ZTUMcidNgTvWJiMamfUsQfqJBSpeW
 o1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NI3HALMe9VoPPwpdY2ibEtaa7vpbSYNUdSX7WB9BX6c=;
 b=izVIrF8qoOeuBTIfFgnuP8Jyzs1qSMhkkKp57DFVB+7J+AR+LXcIVtlKO0A2QqXiaG
 lieHub1GeCCyUCkla8OcJ61nwWfPI3JsfQuf7dBc6gpHlcQxHavNv/HyZrJ3rbpTkdAa
 RU8eGx1vRveflXSwWTEDcnfo7hmdZQwmJD+MZBp1NZyR+66aKIa4gcQMi3XnJ0JZxCz9
 MpNDJ+Kbto3kv6k1IDQWjiLpSn+JKliwNuOSE/ENchb9Y9zS/WH9vN+5kWSJETyIzot2
 lj//ReEbIv/bgz8Z4S3/CTpI4d/MMwMR/DfHHCLjuwdUDnve69G98aaoRdLacemihec8
 +55g==
X-Gm-Message-State: AOAM531gciQGkPAjn7+Oev+ld6Y0H+xtNRydjYpjW3n4p6bnn5bZl/D9
 N7DY+e8tkeTEgh1/w2c7TxnDSlNXNw7XOJg8ycE=
X-Google-Smtp-Source: ABdhPJzkLPd9xCJ+qQd+8aCLljYy+caekTMl7vrechftFXja6TIS5x9k8T7MKMb5WE1PlaxB5LT2kX2aKjeDNKxVC6c=
X-Received: by 2002:a7b:c7c2:: with SMTP id z2mr4396861wmk.39.1594131298798;
 Tue, 07 Jul 2020 07:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A72dDioJeuFhOeW8OovUde2iCrhFaN9VcnhcNdZEKiAgw@mail.gmail.com>
In-Reply-To: <CAAxE2A72dDioJeuFhOeW8OovUde2iCrhFaN9VcnhcNdZEKiAgw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Jul 2020 10:14:47 -0400
Message-ID: <CADnq5_PYn4tb-4XHfsGfFQMWa2Ab_ApPnr6RHi9ztUoemfhkRA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: don't do soft recovery if gpu_recovery=0
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
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
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KCk9u
IE1vbiwgSnVsIDYsIDIwMjAgYXQgNjoyOSBQTSBNYXJlayBPbMWhw6FrIDxtYXJhZW9AZ21haWwu
Y29tPiB3cm90ZToKPgo+IFBsZWFzZSByZXZpZXcuIFRoYW5rcy4KPgo+IE1hcmVrCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxp
bmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
