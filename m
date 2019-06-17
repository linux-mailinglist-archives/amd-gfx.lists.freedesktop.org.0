Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF3249051
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A0F6E044;
	Mon, 17 Jun 2019 19:50:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1AD6E043
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:06 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d23so12333590qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kg3FL3DL4I5gfV/sVvl+aW3UKIddLtj/ByIMDHbGUxw=;
 b=l46a7WbbcD/R0FU5ptoJAZsgw3HcqlpMoVS9wQz8REmB0W7+W4EE8PamOkwoYevJe5
 jtpqzl8f0AMRtXKO1SynVRR9rIY2MdEmHCCFnGm1P84CmPawXH7VW767RMaM6k85oO8T
 8qMFtS0fKfJGJbuW2yUR3RPdnlPpKW6SOulJDWi9BED05OHu4JhHV57FvLnUQtunaNq/
 JrZwiGEsVLF2DLt6oANVsSidyHat4tUhX5EWN1CiwVoDmfuG1nLZD3TKMgTLcwIPCfEq
 /3U34kcpuEL/Z9vPXqQEFIQTMjRArgmIr0fVrwThlHI+iC+kAG7qXnh3max3x2LoM5Cb
 4Ymw==
X-Gm-Message-State: APjAAAX8mU5zHEWuXaOHnmoFNO0794x2esQ33sx+ZmOCYwCqR77gMTKq
 bJOoUsw+Z+E/qXIH+Nodm6HkYVhh9XM7nA==
X-Google-Smtp-Source: APXvYqxcLVQcJWwKRIdxI2BM/bqgkcgF/+Y/wQRMqbk2ozYWGGrJ4bwtHkEvMJcSCUBkfkTrrTGwzA==
X-Received: by 2002:a0c:9214:: with SMTP id a20mr23758891qva.195.1560801004705; 
 Mon, 17 Jun 2019 12:50:04 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 409/459] drm/amd/display: block passive dongle EDID Emulation
 for USB-C ports
Date: Mon, 17 Jun 2019 14:48:58 -0500
Message-Id: <20190617194948.18667-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kg3FL3DL4I5gfV/sVvl+aW3UKIddLtj/ByIMDHbGUxw=;
 b=akPnsIoCf8+SWZuDXUYeFw6u/0mVLNzQSmdXzRqigydkaVkcyj6dwR36KTsarxT1dC
 H67HdKku/2otn6Q0YWKIK9tP5ZdTPsP2awTuqDEGOEM3X8UsdGPS6prp1xa8UOe5Qe22
 XoQ0iLTDAX43sXhXK42dBMUT94ZSE6Pn2bP2b6AINrIjcv0dPjURDGSGpMaaKvSp2J/n
 q6nGrMdriy/tPh+iLAOtAuU7MVemwX1EzVr0CGYd0uJOSOCLx2cFKs8zo1EXGKh42YzU
 c6LFrPHY/SuKjKfRPeyU/E7RyS4RL7aIo85VqR6hHS5KRokwqG04mQUIIKB83aQJmMyU
 wbOA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Samson Tam <Samson.Tam@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU2Ftc29uIFRhbSA8U2Ftc29uLlRhbUBhbWQuY29tPgoKW1doeV0KRW11bGF0aW5nIHBh
c3NpdmUgZG9uZ2xlIG9uIFVTQi1DIHBvcnQgY2F1c2VzIGlzc3VlIG9uIHNvbWUgYXNpY3MuCgpb
SG93XQpDaGVjayBmb3IgRFBfSVNfVVNCX0MgZmxhZyBpbiBiaW9zIHBhcnNlciBhbmQgcHJvcGFn
YXRlIGl0IHRvCmVuY29kZXIgZmVhdHVyZXMgZmxhZ3MuIElmIERQX0lTX1VTQl9DIGZsYWcgaXMg
c2V0IGFuZCBpdCBpcyB0cnlpbmcgdG8KZW11bGF0ZSBwYXNzaXZlIGRvbmdsZSwgdGhlbiByZXR1
cm4gZmFpbC4KClNpZ25lZC1vZmYtYnk6IFNhbXNvbiBUYW0gPFNhbXNvbi5UYW1AYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IFRvbnkgQ2hlbmcgPFRvbnkuQ2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEJo
YXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldCBMYWtoYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2xpbmtfZW5jb2Rlci5jIHwgMiArKwog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9saW5rX2VuY29kZXIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9saW5rX2VuY29kZXIuYwppbmRleCA2
ZjdhZjIzNWRkNzkuLmIwNGVmNTc2ZWM1YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2xpbmtfZW5jb2Rlci5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9saW5rX2VuY29kZXIuYwpAQCAtNDQ3LDYg
KzQ0Nyw4IEBAIHZvaWQgZGNuMjBfbGlua19lbmNvZGVyX2NvbnN0cnVjdCgKIAkJZW5jMTAtPmJh
c2UuZmVhdHVyZXMuZmxhZ3MuYml0cy5JU19IQlIzX0NBUEFCTEUgPQogCQkJCWJwX2NhcF9pbmZv
LkRQX0hCUjNfRU47CiAJCWVuYzEwLT5iYXNlLmZlYXR1cmVzLmZsYWdzLmJpdHMuSERNSV82R0Jf
RU4gPSBicF9jYXBfaW5mby5IRE1JXzZHQl9FTjsKKwkJZW5jMTAtPmJhc2UuZmVhdHVyZXMuZmxh
Z3MuYml0cy5EUF9JU19VU0JfQyA9CisJCQkJYnBfY2FwX2luZm8uRFBfSVNfVVNCX0M7CiAJfSBl
bHNlIHsKIAkJRENfTE9HX1dBUk5JTkcoIiVzOiBGYWlsZWQgdG8gZ2V0IGVuY29kZXJfY2FwX2lu
Zm8gZnJvbSBWQklPUyB3aXRoIGVycm9yIGNvZGUgJWQhXG4iLAogCQkJCV9fZnVuY19fLAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
