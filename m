Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF4EAD7E4
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 13:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CD389AFF;
	Mon,  9 Sep 2019 11:28:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8362E89AFF
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 11:28:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q14so13399643wrm.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 09 Sep 2019 04:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rDn3DT5k9uINz6yMEukD3H4xKW5RgzuhrDnbt7QRVGU=;
 b=qZFS+i8uagm0UWPgbIqhxmdFrj4d0DUCWtqPCxxusmMRmC75LGHwUn0JnZM4KInC7Q
 2NUEavuaBTs24H/BatWm30htk/r5RAi8dQYPfEZUxWudSGBp88LNIHpmNz7AbP3fU5V0
 EtnkbUSU2kbkPh3GvITs3u37X7Slx3PsRVCtPCitQWWTnpLPLqCVITrU75ILhRLCKk99
 Yl0erWVlJ3pSc7eVNClZgdHlAdEytrQ3jc32++BwupQSFshOdNoy6hTb+SkoIkmuS3hK
 1ms7/VJvXnyLwCYHHbshDDRg08+8gVtpl8W+MNv536BGR/K5PBWuMkeiN5M5qSyILA8J
 figg==
X-Gm-Message-State: APjAAAXhvSmC3hjt6YDec2eetzaUu5iLmJCCJRq/8iUlrqr5HTILhwCP
 5/EFsQukk2j7/aH8Fd5R9GW9WkaK
X-Google-Smtp-Source: APXvYqwx8WTCAYJrKUOTmkJVO8juuQLcP+ic4ewj7eig7oe4lBdTL711q97h/zgbdzsOE6n4yiyNmw==
X-Received: by 2002:adf:df0c:: with SMTP id y12mr18340605wrl.43.1568028480063; 
 Mon, 09 Sep 2019 04:28:00 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id l10sm15414862wrh.20.2019.09.09.04.27.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Sep 2019 04:27:59 -0700 (PDT)
Subject: Re: [PATCH 1/1] drm/amdgpu: Fix KFD-related kernel oops on Hawaii
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190905232915.5537-1-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <459c18b6-9b85-14b1-d42c-a49896df77ce@gmail.com>
Date: Mon, 9 Sep 2019 13:27:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905232915.5537-1-Felix.Kuehling@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rDn3DT5k9uINz6yMEukD3H4xKW5RgzuhrDnbt7QRVGU=;
 b=MNvwYgQ4SsBsus24/N43dR81BkBdmicccjY5vEND0Mpm6i++J+BtXMUosJRLJgzSN2
 Lx6+U4Y4qHPYSSVcgOSCeRUWeWMpT44WAliUQ/vJiwnqoCOMz8HQTpmY6vYZCWN2//tN
 hP0O3sq6gweOVsROB3oY5t7rJYP/4GG8zcoaGcYnRCbaAoscAvEbzhMbDmtr1MaDZT++
 jHwqZZbUwlPHtoaVYpBfegTlUns8Cymr803F9H9gtIcvZKq09XHNfA8VRgL4rH7bI12L
 d1qA2I4474POrujauVy58YnjQlqXVhYFKKynw1Q6knvaCUVMZ6lWcwQo8vj/6vcgz6Yb
 FHDA==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDYuMDkuMTkgdW0gMDE6Mjkgc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gSGF3YWlpIG5l
ZWRzIHRvIGZsdXNoIGNhY2hlcyBleHBsaWNpdGx5LCBzdWJtaXR0aW5nIGFuIElCIGluIGEgdXNl
cgo+IFZNSUQgZnJvbSBrZXJuZWwgbW9kZS4gVGhlcmUgaXMgbm8gc19mZW5jZSBpbiB0aGlzIGNh
c2UuCj4KPiBGaXhlczogZWIzOTYxYTU3NDI0ICgiZHJtL2FtZGdwdTogcmVtb3ZlIGZlbmNlIGNv
bnRleHQgZnJvbSB0aGUgam9iIikKPiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVs
aXguS3VlaGxpbmdAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2liLmMgfCAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9pYi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMK
PiBpbmRleCA2ODgyZWViOTNiNGUuLmQ4MWUxNDFhMzNmYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9pYi5jCj4gQEAgLTE0MSw3ICsxNDEsOCBAQCBpbnQgYW1kZ3B1X2li
X3NjaGVkdWxlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdW5zaWduZWQgbnVtX2licywKPiAg
IAkvKiByaW5nIHRlc3RzIGRvbid0IHVzZSBhIGpvYiAqLwo+ICAgCWlmIChqb2IpIHsKPiAgIAkJ
dm0gPSBqb2ItPnZtOwo+IC0JCWZlbmNlX2N0eCA9IGpvYi0+YmFzZS5zX2ZlbmNlLT5zY2hlZHVs
ZWQuY29udGV4dDsKPiArCQlmZW5jZV9jdHggPSBqb2ItPmJhc2Uuc19mZW5jZSA/Cj4gKwkJCWpv
Yi0+YmFzZS5zX2ZlbmNlLT5zY2hlZHVsZWQuY29udGV4dCA6IDA7Cj4gICAJfSBlbHNlIHsKPiAg
IAkJdm0gPSBOVUxMOwo+ICAgCQlmZW5jZV9jdHggPSAwOwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
