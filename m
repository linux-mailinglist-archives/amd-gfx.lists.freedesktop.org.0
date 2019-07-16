Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 025936B042
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 22:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926B66E183;
	Tue, 16 Jul 2019 20:13:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176A46E183
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 20:13:30 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id j6so9786674ioa.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 13:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/041uX2ParIY40Qre356J8y6hFKXmFGWik6EBF8bFeM=;
 b=NggRFAALMwD9Nz30srJVkD4f5wN72Gikn70GMo0qFZGD8f6BkQawziK1aBFVa8ui6Y
 SI8DondikXeidN8OR2ivf8sB/Zs9mLewdGiAu1SLX/zp6r8nBXXsjXr+VIOCO83gufJs
 czNRNBhETMcgMonLPlDEu9LlcxQjLJQ+fJUkGKDN3Rh7hntpNKGODhWBaFph8wg3jsfg
 D9VTpetS8CZGh9ceDIBKSApcEQZLq+A/Xn8RNFWCPv1P2f6HBVFoto3I1PTPZYW+8EL9
 i+dU7zYjLw1SXa5nmwf7e1g22bnxTbsczNn/yOvbFbDUMTLrer6LU5j1GUxrooo8DcDV
 37fg==
X-Gm-Message-State: APjAAAUpOxs6ELaOH2pjRnloz0kFhlpriVBeUsghc1GL8H4I2iCyQtQg
 FTdVbITSrZrNHdz1UHEQwqJgeB4G9JktjM+MyCRi91BGQjW+xA==
X-Google-Smtp-Source: APXvYqweAALASrI91IpLYWdUbGOE20HnyGNAG3TmR8hX6LX8TFt+pcA9w62zK021GF/RJ03bh7AYBHHHqHFiybSSrmU=
X-Received: by 2002:a6b:6611:: with SMTP id a17mr10650833ioc.179.1563308009042; 
 Tue, 16 Jul 2019 13:13:29 -0700 (PDT)
MIME-Version: 1.0
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 17 Jul 2019 01:13:18 +0500
Message-ID: <CABXGCsO53fB_5BPPoGT1XbEmg-8uZsoyC03tqAE+ksDAx6jXcg@mail.gmail.com>
Subject: [bugreport] *ERROR* Waiting for fences timed out or interrupted!
To: amd-gfx list <amd-gfx@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/041uX2ParIY40Qre356J8y6hFKXmFGWik6EBF8bFeM=;
 b=dJdMSDMmb21hMaWb1ZR9zc6Y+UF4APDktAOAcmBXigjc4HcXU4OA2V7g54baQ1vJQb
 soJWzrJWdLE2v0ivonyVEbuCi3sxLhvJjFEeOoXS00Q3rhQbGHPBSCso+5h3yxdJya4f
 Za6VjhqwYrBCNhN4AM9gycGiZbQnd1EQ9bUuFftwTTWaFmWB9WaGU8jSqQqIPAhRVmbD
 dBEFwKX892rZEwgsqNcFMZlyjXyNW2e0mh5Jh67iubI3IxNSk790BBuKpT6P9eCQXQGz
 840/ULYDV+Y561RoglIoQsmbnmepaorYDJOnJJgFSITlE+suhTlyQtuB8KRuUJSt0vo9
 xPLQ==
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

SGkgZm9sa3MuCkkgaGl0IHRoZSBwcm9ibGVtICIqRVJST1IqIFdhaXRpbmcgZm9yIGZlbmNlcyB0
aW1lZCBvdXQgb3IKaW50ZXJydXB0ZWQhIiB3aGljaCBpcyBhbHdheXMgcmVwcm9kdWNpYmxlIGlu
IG9uZSBvZiB0aGUgY3V0c2NlbmVzIGluCnRoZSBnYW1lIE1heCBQYXluZSAzLgoKSSBmaWxsZWQg
YnVncmVwb3J0IGhlcmU6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dp
P2lkPTExMTEyNApBbmQgZHVtcHMgYXJlIGF0dGFjaGVkIHRoZXJlLgpDb3VsZCBhbnlvbmUgbG9v
ayBpcyBlbm91Z2ggaW5mb3JtYXRpb24gdGhlcmUgb3Igbm90PwoKLS0KQmVzdCBSZWdhcmRzLApN
aWtlIEdhdnJpbG92LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
