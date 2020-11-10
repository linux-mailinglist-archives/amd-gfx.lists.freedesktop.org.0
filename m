Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0C92ADC81
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Nov 2020 17:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7511C89ABE;
	Tue, 10 Nov 2020 16:57:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4CE89951
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Nov 2020 09:41:15 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d142so2315115wmd.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Nov 2020 01:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FpGYJhDvWK5QFQyGVGzTwx199bOezzbp8yUQnaBAqhA=;
 b=z1FkXYMrjZ61/g5+TiA3+uQbcP0BwaGKojKYZqoprO1EpyKXxFED8yggOxudY+WSfn
 ofbwOQSsVmAN2CwuTFWmrdeb3XfsFBdxtI2yitO1vEMjZXuOh5FTAx4L9L+9TXE9xEh5
 ETeVhj9TKHMBlglBmUgRq/G1hBrvINoTsfF36vnDxXKP29niGmsVYrAa+6Igc2DCJtfM
 +JVDxu1jrfdlpXrOuive05LAgGh+2RxnKq6Atce+JA4hSUzCkyS+F2jOwHMMM0Ur6JI1
 811Goaf1fdH+uzMu4qeylrud5JCOQT5FRFyLYwgzP5d8ieCENuD1EeKIWtqc1J/U3YgU
 xxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FpGYJhDvWK5QFQyGVGzTwx199bOezzbp8yUQnaBAqhA=;
 b=nd4+QiZSKx1NE4dAQmmQF16GiBI4FPdGDVarY8shh75LWKcrdCqYTeOktR5nmyVwEL
 FjBc0M6R0hnomY6tCv8y3MoQR4hLNPNjFWj7ogLDSWjKuacWif1k4jIn5dJ18WNInuCj
 X+IGsJb4gli8zpz4/9q7SHyzLcnFwmVWIgb4uGfE4dtqECEYPFyRyC7VEPAqXcSKNLsW
 +TRPVXi1DOa9nIIbjamfly7bkp+GM2IoOickMIrwlH++qddqmydiJ3O1Z80hqOZudNPK
 UP+N855mWS8dw7AaZZlG+MqXCC9RZCkxb1YYVVeyVsuSpuFZNc7YoqOcKpafyL1nHfnH
 FRXg==
X-Gm-Message-State: AOAM531vYqCGfBdcEBsZXLbTtcxGvc5PtGNWrsGACK8wvz1Cln/rEqTD
 B2DsyCIDGvG72BQpRFEjZeMgNQ==
X-Google-Smtp-Source: ABdhPJz9GPiQ64tc5Xh9sXsmgb4hk4Z94zN9LrviqA4mXIdYOneWhbgIHv0Sezdp554Cwip1SzZtHw==
X-Received: by 2002:a1c:df04:: with SMTP id w4mr3699025wmg.3.1605001273758;
 Tue, 10 Nov 2020 01:41:13 -0800 (PST)
Received: from dell ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id u203sm1408076wme.32.2020.11.10.01.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 01:41:13 -0800 (PST)
Date: Tue, 10 Nov 2020 09:41:11 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 15/20] drm/radeon/r600d: Move 'rc600_*' prototypes into
 shared header
Message-ID: <20201110094111.GG2063125@dell>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
 <20201109211855.3340030-16-lee.jones@linaro.org>
 <CADnq5_NvitEQWH3Z+5EgOH3zJn=P5YTqwHQo4LLQLi0Hj0Dpww@mail.gmail.com>
 <20201110072242.GF2063125@dell>
 <20201110090247.GB2027451@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110090247.GB2027451@ravnborg.org>
X-Mailman-Approved-At: Tue, 10 Nov 2020 16:57:10 +0000
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexdeucher@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCAxMCBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUsCj4gCj4g
PiA+IHRoZSAqZC5oIGhlYWRlcnMgYXJlIHN1cHBvc2VkIHRvIGp1c3QgYmUgaGFyZHdhcmUgZGVm
aW5pdGlvbnMuICBJJ2QKPiA+ID4gcHJlZmVyIHRvIGtlZXAgZHJpdmVyIHN0dWZmIG91dCBvZiB0
aGVtLgo+ID4gCj4gPiBUaGF0J3MgZmluZSAoSSBkaWQgd29uZGVyIGlmIHRoYXQgd2VyZSB0aGUg
Y2FzZSkuCj4gPiAKPiA+IEkgbmVlZCBhbiBhbnN3ZXIgZnJvbSB5b3UgYW5kIFNhbSB3aGV0aGVy
IEkgY2FuIGNyZWF0ZSBuZXcgaGVhZGVycy4KPiA+IAo+ID4gRm9yIG1lLCBpdCBpcyB0aGUgcmln
aHQgdGhpbmcgdG8gZG8uCj4gCj4gUGxlYXNlIGZvbGxvdyB0aGUgYWR2aWNlIG9mIEFsZXggZm9y
IHRoZSByYWRlb24gZHJpdmVyLgoKR3JlYXQuICBUaGFua3MgZm9yIHJlc29sdmluZyB0aGlzIFNh
bS4KCldpbGwgZml4IGFsbCBvY2N1cnJlbmNlcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10K
U2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9v
ayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eAo=
