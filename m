Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C711F1EBB69
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jun 2020 14:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356776E120;
	Tue,  2 Jun 2020 12:17:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D0D6E120
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jun 2020 12:17:32 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u26so2128804wmn.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jun 2020 05:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+nANGeDXIMJabImRBliBngwTDKDlMRHRVGFl5IFl4YY=;
 b=alL9+Pos9KSE1JL6j56jxEAT85ASL4c/NYSGOlrCtLFtRio/4HrHlmkWgLpQLVXfjY
 fN2YoGc8N9jiI7F3bnAzpHZb6V9EI2spezJIn7urUXRUeyX2k+QVuKtN/AJmkTSBhv/n
 2UfHFkdwhjtgtVVKgptczDNrgR2mWKl9lcIKOcXAVbyOaWSzjCwE0kCTRAeF5Rb3eK0Y
 315hMdgXlNX37kNqeNv1jxFptFHrbN/ckzM+htOIhoeKKdJ/S0BBgpt5YZrxKkQXyjFW
 hPZkRIEbDixFKHcKaZ4ABdiJTg6CbBtaWQ1hpnr5xaeEJv2zhHNc6eijn00WmQX6mWwL
 aNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=+nANGeDXIMJabImRBliBngwTDKDlMRHRVGFl5IFl4YY=;
 b=POE8Z2slqq/obdHGjqtOv9iTuH8hjDhAKryf2N2xXKy6vWfkG9NZ0aaTRGBBf0UksD
 i5GvtvYP3rxjBA8g/hjJ/oh3VuauwHsIWtFJy5nYPKusel4qExgOHHfTM6VfmwlKxCcS
 UxJXgKWm8NCNK+oBd/sfOKSmV8H2b7dNt1MfGfEiBIXEIK/yjTy2AcqS8yL/NVXn5VbX
 OgH3WN5jUZzWmy7aXbgbe+ay4PvzILz1QgNHcaqotVHjL5gFYJYkVRZ2W5qS/4rUsWep
 YjvkCaLgXyhJLOr763kjBAaZXPf8rnoFAHZrx2a0Gxla8LShhkgHn77PXvTsh22hf+kf
 pCCg==
X-Gm-Message-State: AOAM532k7UcHD4uhBrVx1PSE8Kts7Qib1k/UIJRQQWDtd/JD5dpp1xDh
 p3aOQ0S8wvK8Ha0deHjMxuA=
X-Google-Smtp-Source: ABdhPJzFiB4xF25y4R+x6hTSrk7Aj3+8qVi9QIDVlHmcGXC4fliZtkSSNvcZvYfa5MIL2DFBoeXT3w==
X-Received: by 2002:a1c:f712:: with SMTP id v18mr3855012wmh.27.1591100250779; 
 Tue, 02 Jun 2020 05:17:30 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d17sm4027745wrg.75.2020.06.02.05.17.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jun 2020 05:17:30 -0700 (PDT)
Subject: Re: [PATCH 112/207] drm/amdgpu: fix SDMA hdp flush engine conflict
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20200601182054.1267858-1-alexander.deucher@amd.com>
 <20200601182054.1267858-23-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b3e17dda-e233-f011-6f31-3a8826a45c5c@gmail.com>
Date: Tue, 2 Jun 2020 14:17:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200601182054.1267858-23-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDEuMDYuMjAgdW0gMjA6MTkgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gRnJvbTogTGlrdW4g
R2FvIDxMaWt1bi5HYW9AYW1kLmNvbT4KPgo+IEVhY2ggb2YgSERQIGZsdXNoIGVuZ2luZSBzaG91
bGQgYmUgdXNlZCBieSBvbmUgcmluZywgY29ycmVjdCBhbGxvY2F0ZSBvZgo+IGhkcCBmbHVzaCBl
bmdpbmUgdG8gU0RNQSByaW5nLgo+IENvcnJlY3QgbWUgdmFsdWUgb2YgZWFjaCBTRE1BIHJpbmcs
IGFzIGl0IHdhcyBjbGVhcmVkIHdoZW4gaW5pdCBtaWNyb2NvZGUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBMaWt1biBHYW8gPExpa3VuLkdhb0BhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc2RtYV92NV8yLmMgfCA2ICsrLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NkbWFfdjVfMi5jCj4gaW5kZXggNTIyMDYwNTBhZGI5Li5mMDcyY2VmMjhiNjAgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8yLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzIuYwo+IEBAIC0zOTEsMTAgKzM5MSw3
IEBAIHN0YXRpYyB2b2lkIHNkbWFfdjVfMl9yaW5nX2VtaXRfaGRwX2ZsdXNoKHN0cnVjdCBhbWRn
cHVfcmluZyAqcmluZykKPiAgIAl1MzIgcmVmX2FuZF9tYXNrID0gMDsKPiAgIAljb25zdCBzdHJ1
Y3QgbmJpb19oZHBfZmx1c2hfcmVnICpuYmlvX2hmX3JlZyA9IGFkZXYtPm5iaW8uaGRwX2ZsdXNo
X3JlZzsKPiAgIAo+IC0JaWYgKHJpbmctPm1lID09IDApCj4gLQkJcmVmX2FuZF9tYXNrID0gbmJp
b19oZl9yZWctPnJlZl9hbmRfbWFza19zZG1hMDsKPiAtCWVsc2UKPiAtCQlyZWZfYW5kX21hc2sg
PSBuYmlvX2hmX3JlZy0+cmVmX2FuZF9tYXNrX3NkbWExOwo+ICsJcmVmX2FuZF9tYXNrID0gbmJp
b19oZl9yZWctPnJlZl9hbmRfbWFza19zZG1hMCA8PCByaW5nLT5tZTsKPiAgIAo+ICAgCWFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIFNETUFfUEtUX0hFQURFUl9PUChTRE1BX09QX1BPTExfUkVHTUVN
KSB8Cj4gICAJCQkgIFNETUFfUEtUX1BPTExfUkVHTUVNX0hFQURFUl9IRFBfRkxVU0goMSkgfAo+
IEBAIC0xMjI0LDYgKzEyMjEsNyBAQCBzdGF0aWMgaW50IHNkbWFfdjVfMl9zd19pbml0KHZvaWQg
KmhhbmRsZSkKPiAgIAkJcmluZyA9ICZhZGV2LT5zZG1hLmluc3RhbmNlW2ldLnJpbmc7Cj4gICAJ
CXJpbmctPnJpbmdfb2JqID0gTlVMTDsKPiAgIAkJcmluZy0+dXNlX2Rvb3JiZWxsID0gdHJ1ZTsK
PiArCQlyaW5nLT5tZSA9IGk7Cj4gICAKPiAgIAkJRFJNX0lORk8oInVzZV9kb29yYmVsbCBiZWlu
ZyBzZXQgdG86IFslc11cbiIsCj4gICAJCQkJcmluZy0+dXNlX2Rvb3JiZWxsPyJ0cnVlIjoiZmFs
c2UiKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
