Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E760B216E7A
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Jul 2020 16:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313F16E0BA;
	Tue,  7 Jul 2020 14:16:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE496E0BA
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jul 2020 14:16:52 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id o11so45356418wrv.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 Jul 2020 07:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=2D41CelBrvrrIFCahQbQ8VYjQykm7lz/SsBWOmGdEbg=;
 b=MVhloaK76ARmGhToxAUuiuciF4b3eX4DM1D9dKljllNQFVSOo+4nqZ330Jw9xbTVbN
 MYZW6Ah5hW4UTgIZV3is+R4dNNXipSzLC6osqm3wjhjhSfm6K2OeZCsBdgO3WijkSBX4
 z2k73SWRlzHXm/IU58F6YtyyiLlMxrYoIhVBZwTGCB4cEGKWGnLV3meyOo+erO+pLTxK
 +mrVMnvWDRo+jAWzkt2EDJH4QTakleL9viIKKB4bwpOrLhuGsKdoMfQoJCCwnAvMASg9
 jBTD1WTW21pD8jbS0JFLWOBVIF4CMAJhhjbKE32mmVFJwyD0MG7UJbfGvQDXxxiBMrI2
 bjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=2D41CelBrvrrIFCahQbQ8VYjQykm7lz/SsBWOmGdEbg=;
 b=Xua9s0eks3BQTZY5Ffw/KxZUIgImwJW49Tp6Sugz5LcQX1lVjdSIhAD1tiSaHnOd6q
 UxdXAcN5+Zi0c8q8HnCZs5TVs48jtaKblWiMMv+C4u5Cb5xIqlCsLlHfWPa47+tuJKc9
 XDiXLOs6W5ezKDXW1X8spoSwkQgLqCPv+CIjfNsmubPHsuQ63IuBQzY172BqFKB5PibT
 ihk8zZZrOrvch3X0RMurjKnUAhpzd/G+crr8AI5iLEunjqHxmqiRBVFJ+9odu0QXwYb9
 ytdv6RgQ1xtjOkycDbBiuNHeRIz1paQSrgSx4qlfxjMqYnJX3wu19dz9D6PRah5q99Uq
 XSMw==
X-Gm-Message-State: AOAM531qBT0i3Ab5w2Zn2k6WlX1hVq5TAF/gNT3rLz2RI43XbHVlvEh9
 BPitsLQpQvqyOXjaMZtCCvyjXLTm
X-Google-Smtp-Source: ABdhPJx3hPF/uKcrfNgy+HicF1lvlSdD4n4UdeahPw+wvso0+g+uaP9vxrlLsaX1LYWyTMIvGe06NA==
X-Received: by 2002:adf:f20a:: with SMTP id p10mr57351447wro.41.1594131410597; 
 Tue, 07 Jul 2020 07:16:50 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c15sm1309684wme.23.2020.07.07.07.16.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Jul 2020 07:16:49 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: don't do soft recovery if gpu_recovery=0
To: Alex Deucher <alexdeucher@gmail.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <maraeo@gmail.com>
References: <CAAxE2A72dDioJeuFhOeW8OovUde2iCrhFaN9VcnhcNdZEKiAgw@mail.gmail.com>
 <CADnq5_PYn4tb-4XHfsGfFQMWa2Ab_ApPnr6RHi9ztUoemfhkRA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <379aad8a-1925-bbf2-21d8-d4c9ee0a50ca@gmail.com>
Date: Tue, 7 Jul 2020 16:16:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_PYn4tb-4XHfsGfFQMWa2Ab_ApPnr6RHi9ztUoemfhkRA@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
CkFtIDA3LjA3LjIwIHVtIDE2OjE0IHNjaHJpZWIgQWxleCBEZXVjaGVyOgo+IFJldmlld2VkLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4KPiBPbiBNb24sIEp1
bCA2LCAyMDIwIGF0IDY6MjkgUE0gTWFyZWsgT2zFocOhayA8bWFyYWVvQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+IFBsZWFzZSByZXZpZXcuIFRoYW5rcy4KPj4KPj4gTWFyZWsKPj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYW1kLWdmeCBtYWlsaW5nIGxp
c3QKPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngK
