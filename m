Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EB31C70D
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 12:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AAC8892DE;
	Tue, 14 May 2019 10:33:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71276892E0
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 10:33:39 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f204so2304656wme.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 03:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=b5Iin3MyBEd4+dzULgGozX4g18SE7uc/ovVflPrbCDw=;
 b=RPDlqvfeO1XNSVTYXpw08a68o/9c1kn6UOKQf8DR+MkB06OQE+Abj3HKl7qw4jmueM
 rV1UpaHTKnmCeSNtgYH1BdGJoSfwE21P/jOsDYVrA8Yom0Hhzn8QPS0qqVuVt4QseJrD
 O4+a4bjCQopdP8d/e2HHUpLEzrrW/G2961cFfX4CiePnUoxi4BMUTSd/8M/po94q8gRZ
 rF7iiy9hWB9Lo8+EKlQWONRHf8gaYVq5rTVykGlOC2tJfcJb3JOfIxm3HbR1kF+9olml
 8tmMiCRcl4fDWRyvTaO8OgT5zoep9rJ9FVGwcqppgqmgh5GPMSX87tWrEW4axd8CCc+k
 G4Qg==
X-Gm-Message-State: APjAAAV3MXXpADpxXV4pzvraRevbLNpwYKumjQJk0ev0yQwLVaKmQei4
 41+yxqGXOta4qxak9KDHaG0=
X-Google-Smtp-Source: APXvYqzL8O9P/ATLnLpLBiEDDtZMMdduOPJWD3qK1I98baHDDxSN2gOkch31PcKe1wdcthW5WkW3Hg==
X-Received: by 2002:a1c:f70e:: with SMTP id v14mr19680549wmh.74.1557830018163; 
 Tue, 14 May 2019 03:33:38 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id t2sm1658519wma.13.2019.05.14.03.33.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 03:33:37 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu/sriov: Need to initialize the
 HDP_NONSURFACE_BAStE
To: Tiecheng Zhou <Tiecheng.Zhou@amd.com>, amd-gfx@lists.freedesktop.org
References: <1557829492-5991-1-git-send-email-Tiecheng.Zhou@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8cca3031-e258-785c-331c-6c6d32421ed0@gmail.com>
Date: Tue, 14 May 2019 12:33:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557829492-5991-1-git-send-email-Tiecheng.Zhou@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=b5Iin3MyBEd4+dzULgGozX4g18SE7uc/ovVflPrbCDw=;
 b=g43UsOT/Z4ZKsZ1NNCtQ9qlfb5fjEllPXdEGazblM3eK1nkdx1CFcdWf0Huokza+db
 9gFU2reaYHpAsMbMhrzvT3Ymv9jJpn5HZD/XeOmgCOt04WNInN14+JpmwEd97yDq1wAj
 FAfzJC5Z1ZqgMXLOhlpplCX1SHFfh1WFyl3+nljsQGQ8GUUuhlEfJ160ZX6YZBxETNsB
 8gsb3tDEUIZfsORZY2YlCv3oGkOmspZJe9KXyppJofz2B8f3MObDqkofhv9jLFmg87ro
 jlYvx4moox36DtJMFmKt/LSeExD6pKOssoG0Vu4VW4HF1x2/336Jhx+MO/FuvSJx9Dvx
 zCBA==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Emily Deng <Emily.Deng@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTQuMDUuMTkgdW0gMTI6MjQgc2NocmllYiBUaWVjaGVuZyBaaG91Ogo+IGl0IHJlcXVpcmVz
IHRvIGluaXRpYWxpemUgSERQX05PTlNVUkZBQ0VfQkFTRSwgc28gYXMgdG8gYXZvaWQKPiB1c2lu
ZyB0aGUgdmFsdWUgbGVmdCBieSBhIHByZXZpb3VzIFZNIHVuZGVyIHNyaW92IHNjZW5hcmlvLgo+
Cj4gU2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IFRpZWNoZW5nIFpob3UgPFRpZWNoZW5nLlpob3VAYW1kLmNvbT4KCldvdWxkIGl0
IGh1cnQgdXMgdG8gYWxzbyBkbyB0aGlzIG9uIGJhcmUgbWV0YWw/CgpBcGFydCBmcm9tIHRoYXQg
bG9va3MgZ29vZCB0byBtZSwKQ2hyaXN0aWFuLgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMgfCA1ICsrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKPiBpbmRleCBi
ZTcyOWU3Li5lOTY2ODRlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192OV8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5j
Cj4gQEAgLTExODEsNiArMTE4MSwxMSBAQCBzdGF0aWMgaW50IGdtY192OV8wX2dhcnRfZW5hYmxl
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgCXRtcCA9IFJSRUczMl9TT0MxNShIRFAs
IDAsIG1tSERQX0hPU1RfUEFUSF9DTlRMKTsKPiAgIAlXUkVHMzJfU09DMTUoSERQLCAwLCBtbUhE
UF9IT1NUX1BBVEhfQ05UTCwgdG1wKTsKPiAgIAo+ICsJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2
KSkgewo+ICsJCVdSRUczMl9TT0MxNShIRFAsIDAsIG1tSERQX05PTlNVUkZBQ0VfQkFTRSwgKGFk
ZXYtPmdtYy52cmFtX3N0YXJ0ID4+IDgpKTsKPiArCQlXUkVHMzJfU09DMTUoSERQLCAwLCBtbUhE
UF9OT05TVVJGQUNFX0JBU0VfSEksIChhZGV2LT5nbWMudnJhbV9zdGFydCA+PiA0MCkpOwo+ICsJ
fQo+ICsKPiAgIAkvKiBBZnRlciBIRFAgaXMgaW5pdGlhbGl6ZWQsIGZsdXNoIEhEUC4qLwo+ICAg
CWFkZXYtPm5iaW9fZnVuY3MtPmhkcF9mbHVzaChhZGV2LCBOVUxMKTsKPiAgIAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
