Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EC1D5596
	for <lists+amd-gfx@lfdr.de>; Sun, 13 Oct 2019 12:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3834A6E0D5;
	Sun, 13 Oct 2019 10:02:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C963F6E0D5
 for <amd-gfx@lists.freedesktop.org>; Sun, 13 Oct 2019 10:02:16 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id c6so30643038ioo.13
 for <amd-gfx@lists.freedesktop.org>; Sun, 13 Oct 2019 03:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=e0OMu6JsqiwSMmD2M/0Dy/QUokVikWmpPVuN7xPOPjA=;
 b=NnykHG5iqp27Yc961LopPEXZOQGUClbckBRdIgbJMbHDdVVHtP3bcyF0mSVXfIJ6Dr
 gb17Kaq5Ythy5G2c27ve1ubJb6EQ1iMHSNElB1w0i5rZ08AQxD26VuFUaSbnjQzr+RzM
 D+ZpAfJ5ZBVpx74TOjLo/EQK1Te/fFlhHZHrFz3mw0WyGP9xXlMtb4xP2t1L7znTxnNI
 MFFxeO4uYrncPGr9ghE8WK/2HllI+61lDKZPUrtdVBZEzfoIMeEgHbvLEoxYPkH/4ZWw
 fC6Qwb5nLFtUegKee3H97y1DMe+AfQlmw9SqUoEILzw0ORLqR2uMXJfB5dYJVKmltm/B
 ORUw==
X-Gm-Message-State: APjAAAWfuQ80FbzPUX1grnOiXWkkcfCmFRdspiytvxlLBOYp7/uTetJm
 pyK4qhC6tyqP8xfX8VLdLRFe2t7eUZGD/rDAhx5LVEAi
X-Google-Smtp-Source: APXvYqy0yL8/GutfC1lHfjS0+I+kWgifGuMebGNAWxSSB+dTUmQTvxFE0R2AJOYQKniy+/c/Hfs/ZoWs6rvsFfQM3KI=
X-Received: by 2002:a6b:908:: with SMTP id t8mr29480485ioi.129.1570960935986; 
 Sun, 13 Oct 2019 03:02:15 -0700 (PDT)
MIME-Version: 1.0
From: Witold Baryluk <witold.baryluk@gmail.com>
Date: Sun, 13 Oct 2019 10:01:40 +0000
Message-ID: <CAEGMnwo7YT2haKrXy5nC1drQObLA20f+vnLLUpOA6JeHP8qx9w@mail.gmail.com>
Subject: Issues with gpu_busy_percent? Unstable performance / sclk on AMD Fury
 X.
To: amd-gfx@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=e0OMu6JsqiwSMmD2M/0Dy/QUokVikWmpPVuN7xPOPjA=;
 b=oGCBK9Z+Jj443ZU9zmJy35hRGzcFpATHakhhsnVjuHDpOoIFpETVygj3Ql56nsRlVy
 bU3Ibo1Ap3/jqEFOclC1HSlgln23JyTRj/JiNEQivk3+whRQVnbRhqzTSCJ7KVLhnPA8
 W4lEgItj9j1+3GSjc7gGV+xVBVfEbYvHU5K3xuv7Q2qZJ3+cqrnQkYmUhYIvju3j0LBc
 6dcVeaO1LON8CHIgigtqV60eQFQBkjWU7SrpxxbPCsBnWyqzsZvtH48gDD6YS+WhU9iF
 /3PzyWoIeiTL8LcDT3IbmxsTDv5SVVZnxpnxPtHxJXkILEUKuc6e6Or2E/q+77smo9sn
 YIZQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGksCgpJIGZpbGxlZCB0aGUgYnVnIGluIHRoZSBidWd6aWxsYSwgYnV0IEkgYW0gbm90IHN1cmUs
IGlmIEkgZmlsbGVkIGl0IGluCnRoZSByaWdodCBjb21wb25lbnQsIHNvIEkgYW0gcG9zdGluZyBp
dCBoZXJlIHRvby4KClVuc3RhYmxlIHBlcmZvcm1hbmNlIChwZXJpb2RpYyBhbmQgcmVwZWF0aW5n
IHBhdHRlcm5zIG9mIGZwcyBjaGFuZ2UpCmFuZCBjaGFuZ2luZyBWRERHRlgKaHR0cHM6Ly9idWdz
LmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExOTg3CgpJIHN1c3BlY3QgaXNzdWUg
aXMgd2l0aCBmcmVxdWVuY3kgc2NhbGluZywgaHlzdGVyZXNpcywgb3IKZ3B1X2J1c3lfcGVyY2Vu
dCBvciBzb21ldGhpbmcgYXJvdW5kIGl0LgoKT3IgbWF5YmUgaXQgaXMgd29ya2luZyBhcyBpbnRl
bmRlZCwgc28gcGxlYXNlIGxldCBtZSBrbm93IG9yIHN1Z2dlc3QKZXh0cmEgc3RlcHMuCgpUaGFu
ayB5b3UuCgotLSAKV2l0b2xkIEJhcnlsdWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
