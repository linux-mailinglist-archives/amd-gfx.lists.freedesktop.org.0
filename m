Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB99331E743
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Feb 2021 09:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5456E39B;
	Thu, 18 Feb 2021 08:08:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE396E39B
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Feb 2021 08:08:03 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id i14so2320205eds.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Feb 2021 00:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ET3+jp3N9JAFXP9q8J+F4po7hBCtdRu1NRow0GYyfBg=;
 b=M1EZ+nxRZeqg39GWx0bP/3sitmvshgXVOevyTwh8EqpvsAhwYI0ctJ2T91Q8aWrqU8
 jsMwCf1cnS9RfIm9d2a+ss0s8pQNfvThTafZ0LnG1fTRfdIujQyoks91Ykb5mEoBxwMD
 L280vQadYYxV3w+FVWPFy+TBg7JldC3rGHclPsVPijhtMTfNv3RQlNQzwmYbhVofmTY3
 B6bseWYKMsqo5WZpuPoWcqsBgekqJVjZb7+Ul75bx8YM0z6gOwmna+UuzAVeIdKLsy77
 zYDlADLpVuFeMGnTMMjfC6y36BFovP/uRv/CXAHlPEW8kkXCzQii//kVTP6c25Y0R3eX
 UNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ET3+jp3N9JAFXP9q8J+F4po7hBCtdRu1NRow0GYyfBg=;
 b=B0wJ5h6y2qJlBRwjBKiiKX80z4SH0VX5NnEv0jhbIhugeojKIxN2uL6bo4x2O93Z2n
 R+R87Zz2fysa4DDVthBVQ/wlfUkazHYe9SYb53EIc+0VEmPZGaxs86Q9ekdCZVNV6oGc
 JBQIMLcSVCRe0/QW/6PSZNP6xd2/fVyrUUa+LxS2VZMTDP/xohGZEQMvIS2cKTamc2Kn
 mhuuGPqhmg/caRKBlpWgqbnMBsFkkxvzbEdDyugJVwSzpPkEEE5jhd9NNwwQ1DOkeGJT
 +FZzjW3zAp9wBzlnAzFXhUfRqurP4CgXRpXX1Z/2cCX0iSS73i/GJQeHete2ooRW1dol
 Jmbg==
X-Gm-Message-State: AOAM532lUmqUuglaMC0qnvZMKQmaXzLldbFdt1DeUsxDgIafVF/7kYW1
 ZJPyXwnWPM8rhodBcGgoDeI=
X-Google-Smtp-Source: ABdhPJxwLlUZG3tlpl3f8ampq1YEU4QJPbiUCcknwtS4oe0mj6IokwFaLMF/InR/jpz17bTccLm9Xg==
X-Received: by 2002:a05:6402:4391:: with SMTP id
 o17mr2902366edc.196.1613635682577; 
 Thu, 18 Feb 2021 00:08:02 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:e2a7:31f6:576:887?
 ([2a02:908:1252:fb60:e2a7:31f6:576:887])
 by smtp.gmail.com with ESMTPSA id y20sm2204310edc.84.2021.02.18.00.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 00:08:02 -0800 (PST)
Subject: Re: [PATCH] drm/admgpu: Set reference clock to 100Mhz on Renoir (v2)
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20210217222018.2291196-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ec231c14-7196-b40c-cd46-faf9ab4bf9f3@gmail.com>
Date: Thu, 18 Feb 2021 09:08:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217222018.2291196-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTcuMDIuMjEgdW0gMjM6MjAgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gRml4ZXMgdGhlIHJs
YyByZWZlcmVuY2UgY2xvY2sgdXNlZCBmb3IgR1BVIHRpbWVzdGFtcHMuCj4gVmFsdWUgaXMgMTAw
TWh6LiAgQ29uZmlybWVkIHdpdGggaGFyZHdhcmUgdGVhbS4KPgo+IHYyOiByZXdvcmQgY29tbWl0
IG1lc3NhZ2UuCj4KPiBCdWc6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1k
Ly0vaXNzdWVzLzE0ODAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+CgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMgfCAyICsrCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NvYzE1LmMKPiBpbmRleCBjN2QwZTBlOTgzOTEuLjIzMGNhYWEzNTEzZiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwo+IEBAIC00NjMsNiArNDYzLDggQEAg
c3RhdGljIHUzMiBzb2MxNV9nZXRfeGNsayhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAg
IHsKPiAgIAl1MzIgcmVmZXJlbmNlX2Nsb2NrID0gYWRldi0+Y2xvY2suc3BsbC5yZWZlcmVuY2Vf
ZnJlcTsKPiAgIAo+ICsJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JFTk9JUikKPiArCQly
ZXR1cm4gMTAwMDA7Cj4gICAJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JBVkVOKQo+ICAg
CQlyZXR1cm4gcmVmZXJlbmNlX2Nsb2NrIC8gNDsKPiAgIAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4Cg==
