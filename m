Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D22537C80
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 20:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64B88972B;
	Thu,  6 Jun 2019 18:48:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E998967F
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 18:44:49 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id i34so3899845qta.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 06 Jun 2019 11:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GDhglHPFaykanjjoF1gAri47ISjb+fimKQAKOR+h9MI=;
 b=uQARAooKxX/zophcXYwvn5HVw9G2urHxEORHuCIUz8NkhbCRxR6Y+yAzLxajs3yiFH
 06li0xLz7fZ/E5TMD5uZvJI4leZ6/TGC3AoQ5jcRmy5WaHNH6whIWOeZEtapnMT/gjHU
 Rmfgu3c2ZTA12YQSmY9ku+iLsWUzhkihU+aG3QD6B3Yr8iB5SjJmFIKdb43SUhqRbKku
 Js951q8dBV9hXhVSHvhCmvgnR+4yjNfjaYy6ap+VA+m67jlxDs8tn3s56FyiWM/TYGCR
 Go9Ho8T1uARaIWFSc6Zd3zozv1dInxqGD7JiT2XdcmvolCEEtYNHhXNOA9gYhwzHAA//
 Iwdg==
X-Gm-Message-State: APjAAAV/s5u8g9w5tkpkLyPcHFcegHgWnPe+YNnAVPa8Y5tOesC7b2ml
 F/ZJTAyhsM43L5NgKhutQRl1Mw==
X-Google-Smtp-Source: APXvYqyc+KhO/w9mb/yqATHQoXsEv3qzyCLAVUEuPTK/WR5bBDKxmiMb1le/dUnjSV/gm3c3d4B8Pg==
X-Received: by 2002:ac8:f0a:: with SMTP id e10mr39961260qtk.325.1559846689071; 
 Thu, 06 Jun 2019 11:44:49 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id w34sm1260252qth.81.2019.06.06.11.44.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 11:44:46 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hYxNV-0008If-OA; Thu, 06 Jun 2019 15:44:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 07/11] mm/hmm: Use lockdep instead of comments
Date: Thu,  6 Jun 2019 15:44:34 -0300
Message-Id: <20190606184438.31646-8-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606184438.31646-1-jgg@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Jun 2019 18:48:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GDhglHPFaykanjjoF1gAri47ISjb+fimKQAKOR+h9MI=;
 b=PxwcFgRpu1yKtgG+aowdw5x+8tofPqN/iG+sZlMS+1BEgLEa2wfuOLDwkMIpgzpwcd
 07df04JSrSYFDPlOBaTxTsHwx7kBZmstHd0a4oVfpGuC/g/Bhpf3Lt5nSoYeD6uPrpsQ
 QII6+kEeEkW/MUSdxlhOd0i2T95D5HdQdwlL7Ozqf48joL6SQYTkyLT5peB4+TMiTij9
 aIRgom5VV0qkHk9b2ZOSyXv7P9Z7i69saCcXZ47LPPfmx+ZPD9nsxaz5ycev8w2P6F6R
 TEDZZY+v7m2CrZJVilSqXEyPa+l6AO++F7IzKVzBSzLlDLqpq+DAzeUJPhu5fEg2sxO9
 4usQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKU28gd2UgY2FuIGNoZWNr
IGxvY2tpbmcgYXQgcnVudGltZS4KClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdn
QG1lbGxhbm94LmNvbT4KUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRo
YXQuY29tPgotLS0KdjIKLSBGaXggbWlzc2luZyAmIGluIGxvY2tkZXBzIChKYXNvbikKLS0tCiBt
bS9obW0uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4IGY2N2JhMzI5
ODNkOWYxLi5jNzAyY2Q3MjY1MWI1MyAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1t
LmMKQEAgLTI1NCwxMSArMjU0LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVy
X29wcyBobW1fbW11X25vdGlmaWVyX29wcyA9IHsKICAqCiAgKiBUbyBzdGFydCBtaXJyb3Jpbmcg
YSBwcm9jZXNzIGFkZHJlc3Mgc3BhY2UsIHRoZSBkZXZpY2UgZHJpdmVyIG11c3QgcmVnaXN0ZXIK
ICAqIGFuIEhNTSBtaXJyb3Igc3RydWN0LgotICoKLSAqIFRIRSBtbS0+bW1hcF9zZW0gTVVTVCBC
RSBIRUxEIElOIFdSSVRFIE1PREUgIQogICovCiBpbnQgaG1tX21pcnJvcl9yZWdpc3RlcihzdHJ1
Y3QgaG1tX21pcnJvciAqbWlycm9yLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKIHsKKwlsb2NrZGVw
X2Fzc2VydF9oZWxkX2V4Y2x1c2l2ZSgmbW0tPm1tYXBfc2VtKTsKKwogCS8qIFNhbml0eSBjaGVj
ayAqLwogCWlmICghbW0gfHwgIW1pcnJvciB8fCAhbWlycm9yLT5vcHMpCiAJCXJldHVybiAtRUlO
VkFMOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
