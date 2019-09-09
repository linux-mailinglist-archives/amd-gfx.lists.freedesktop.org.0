Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCA3AD3D1
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 09:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3AE88F1E;
	Mon,  9 Sep 2019 07:25:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5446C89498;
 Mon,  9 Sep 2019 04:31:55 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id 4so5952351pld.10;
 Sun, 08 Sep 2019 21:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=e7eA4TFiax+IpWz4ZBj8yfhtlvkgl3W+E1T6Ih3BFts=;
 b=GL4KIVX7okGuCeLeFZXhy+4+qHvaVu+OToT2XqNnOZlhKvr5hU0hJfJSGHVAvZMexE
 CatwcxQDkMGvxbB+Zx0xuin0M67G0Y6urCLoWvxcGJw/ExM4/v2X4Zw3I8W1xgXle0vz
 05FQNqggcZpPXHt6iWjcYO7CcoIMCXcBrshpBssWVYgGFid1qrTr/BoxnXOux4n3rpr4
 TCnaBhi4cs/qD4MkOECrVQIwu70aEwZyx81GhoKj/+p8CITt0Kx/7NEkQxh3e8cOEnDT
 +qVqdsYjvxp2Tqp0/Mff+FJflcy9/SKnLo1IECOOJZdQNuSIstxM5gVs3dc84JeGTwR6
 RIzA==
X-Gm-Message-State: APjAAAXkzuhhOcJf/yLD3p20/K+Wbk4vrGEcemG4YNmib2gz+dJcB/KY
 Om8+dgrijSl71vK00FDO3Hk=
X-Google-Smtp-Source: APXvYqyMflNLQ8szL7leKJSNcJrJy07FtvlAX1V6hB8wspa6yvwGSNIFRsCUH5IFTKfq9I8OvssVPA==
X-Received: by 2002:a17:902:a618:: with SMTP id
 u24mr20696843plq.342.1568003514746; 
 Sun, 08 Sep 2019 21:31:54 -0700 (PDT)
Received: from LGEARND20B15 ([27.122.242.75])
 by smtp.gmail.com with ESMTPSA id x8sm13449170pfn.106.2019.09.08.21.31.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 Sep 2019 21:31:54 -0700 (PDT)
Date: Mon, 9 Sep 2019 13:31:48 +0900
From: Austin Kim <austindh.kim@gmail.com>
To: alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/amd/powerplay: Remove unnecessary comparison statement
Message-ID: <20190909043148.GA112744@LGEARND20B15>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:25:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=e7eA4TFiax+IpWz4ZBj8yfhtlvkgl3W+E1T6Ih3BFts=;
 b=KPePtxneizbd2oR42TZs5GjLHclye/D8S+i23XA0Fj8s3hqwGfvGHBirF5uxu5j9gW
 a6TGX1XFQbmS4Mvqij4vwJ0fRRFfFQ4sr6acc2omLXGYal4NooqdstYDlrx/XQ3i4eZh
 IKjudpm687JAlftFhifPgIiFXgj9ru1aAHuL2TcnkoQaaca5OyuHIrAPZZ0gDez3+v3A
 X709lmx5toLrLuhyxbwzKvbrKSZNtZQcye4sNriZsU6jau8/jaeXmJFy3uIkWBv+Sjp/
 kjSCwAdgntqhUgsLuAG6ssKq6012TPEUwwMRGV4Hn0iz1g3w9y8gYEk4GBeIbAK6cPH6
 nuTQ==
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
Cc: David1.Zhou@amd.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

c2l6ZSBjb250YWluIG5vbi1uZWdhdGl2ZSB2YWx1ZSBzaW5jZSBpdCBpcyBkZWNsYXJlZCBhcyB1
aW50MzJfdC4KU28gYmVsb3cgc3RhdGVtZW50IGlzIGFsd2F5cyBmYWxzZS4KCWlmIChzaXplIDwg
MCkKClJlbW92ZSB1bm5lY2Vzc2FyeSBjb21wYXJpc29uLgoKU2lnbmVkLW9mZi1ieTogQXVzdGlu
IEtpbSA8YXVzdGluZGgua2ltQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9uYXZpMTBfcHB0LmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IDEy
YzBlNDYuLjNjN2M2OGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMKQEAgLTExMzQsOSArMTEzNCw2IEBAIHN0YXRpYyBpbnQgbmF2aTEwX3NldF9wb3dlcl9w
cm9maWxlX21vZGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGxvbmcgKmlucHV0LCB1CiAJfQog
CiAJaWYgKHNtdS0+cG93ZXJfcHJvZmlsZV9tb2RlID09IFBQX1NNQ19QT1dFUl9QUk9GSUxFX0NV
U1RPTSkgewotCQlpZiAoc2l6ZSA8IDApCi0JCQlyZXR1cm4gLUVJTlZBTDsKLQogCQlyZXQgPSBz
bXVfdXBkYXRlX3RhYmxlKHNtdSwKIAkJCQkgICAgICAgU01VX1RBQkxFX0FDVElWSVRZX01PTklU
T1JfQ09FRkYsIFdPUktMT0FEX1BQTElCX0NVU1RPTV9CSVQsCiAJCQkJICAgICAgICh2b2lkICop
KCZhY3Rpdml0eV9tb25pdG9yKSwgZmFsc2UpOwotLSAKMi42LjIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
