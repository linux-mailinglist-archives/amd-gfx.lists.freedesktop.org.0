Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECBD37C82
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 20:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F50F89736;
	Thu,  6 Jun 2019 18:48:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E8789686
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 18:44:50 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id w187so2102191qkb.11
 for <amd-gfx@lists.freedesktop.org>; Thu, 06 Jun 2019 11:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m5r23PQEATRs0yuo7EiwMQdVkzY1U+YCz5n+ShEeoJ4=;
 b=Uw604fnjJ8QBDzY94PEmPC8GYdPOfGoi7Ipl5EiFTr3mqgOQjFaIbWL4V+d93PJCXi
 x6jo6OBfPdOUc5/yiH5Pwdn5x5TJer2CwlB2IUck1Fou3EFhj8XM6Ncp9EGR3+ooqVWR
 ILwVDVm124k/r+CwACap3Zj5eLweBpT/aB/qZ/mpy+rA1utBxglcWgVOT8a0LDYnOukj
 lPk3GIcpnalvqZ8XUPzbW0f0/Zrci0sFmhLagsdoe+K//b3iOhJdRH3lgQYHZVqHj8aG
 pmXdOwrl+H9dJV+up4t4tUlhlkP2ZBU3c/VDAaJO7/pu048y6z0diWKrwtcF4eiCTMTB
 bg0w==
X-Gm-Message-State: APjAAAXZy4Hxh88uuSfhz3qm+LkZW57xtm86hoaQqrt2Q4ASOWz6SP1P
 1kizm51G3Fw6qFYY0Tr4Q4tR6g==
X-Google-Smtp-Source: APXvYqyDTfgtep66c/jLgBTZULmgoKmkAN7hyfuI/DrREbp9gQ0U06D4ocKYi5xCroJDWLKbh/kYjQ==
X-Received: by 2002:ae9:c30e:: with SMTP id n14mr34724569qkg.220.1559846689590; 
 Thu, 06 Jun 2019 11:44:49 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id s64sm1267327qkb.56.2019.06.06.11.44.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 11:44:46 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hYxNV-0008Ir-QZ; Thu, 06 Jun 2019 15:44:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 09/11] mm/hmm: Poison hmm_range during unregister
Date: Thu,  6 Jun 2019 15:44:36 -0300
Message-Id: <20190606184438.31646-10-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606184438.31646-1-jgg@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Jun 2019 18:48:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m5r23PQEATRs0yuo7EiwMQdVkzY1U+YCz5n+ShEeoJ4=;
 b=NWo/t5Eg8vkPop9rmLEJM24/TPCJSDGLkfJSg++y8tqe0YH7o0F0c+BLBxXYqlWbHn
 TQBM+rvo5UiyMgZHvqK7Pvgn4ARc08XbQ20YAC3fqCirAP5zyCBTuaRKGYQxA5+ez9MY
 5dtAcK3pg10dTEX2QJmbgVOe2q4izOeIa/IhaKfFTg1LtlOqd5CgPkliph8c0pVndS4n
 r9g5yTZjE2Bz4PyNamQroNF8IT3K4ojSe1Y0KMRcIsSxPFsRL0WgkcnPYGMbxXNaACfs
 /YPv4ioHw6zlpgsrcrlglyXYrBLyXki3e7XQt67BaOsoljLrmJ+pampgcg1bCjvTHEk3
 u1yw==
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

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVHJ5aW5nIHRvIG1pc3Vz
ZSBhIHJhbmdlIG91dHNpZGUgaXRzIGxpZmV0aW1lIGlzIGEga2VybmVsIGJ1Zy4gVXNlIFdBUk5f
T04KYW5kIHBvaXNvbiBieXRlcyB0byBkZXRlY3QgdGhpcyBjb25kaXRpb24uCgpTaWduZWQtb2Zm
LWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+ClJldmlld2VkLWJ5OiBKw6ly
w7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KLS0tCnYyCi0gS2VlcCByYW5nZSBzdGFy
dC9lbmQgdmFsaWQgYWZ0ZXIgdW5yZWdpc3RyYXRpb24gKEplcm9tZSkKLS0tCiBtbS9obW0uYyB8
IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4IDY4MDJkZTcwODBkMTcy
Li5jMmZlY2IzZWNiMTFlMSAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAg
LTkzNyw3ICs5MzcsNyBAQCB2b2lkIGhtbV9yYW5nZV91bnJlZ2lzdGVyKHN0cnVjdCBobW1fcmFu
Z2UgKnJhbmdlKQogCXN0cnVjdCBobW0gKmhtbSA9IHJhbmdlLT5obW07CiAKIAkvKiBTYW5pdHkg
Y2hlY2sgdGhpcyByZWFsbHkgc2hvdWxkIG5vdCBoYXBwZW4uICovCi0JaWYgKGhtbSA9PSBOVUxM
IHx8IHJhbmdlLT5lbmQgPD0gcmFuZ2UtPnN0YXJ0KQorCWlmIChXQVJOX09OKHJhbmdlLT5lbmQg
PD0gcmFuZ2UtPnN0YXJ0KSkKIAkJcmV0dXJuOwogCiAJbXV0ZXhfbG9jaygmaG1tLT5sb2NrKTsK
QEAgLTk0OCw3ICs5NDgsMTAgQEAgdm9pZCBobW1fcmFuZ2VfdW5yZWdpc3RlcihzdHJ1Y3QgaG1t
X3JhbmdlICpyYW5nZSkKIAlyYW5nZS0+dmFsaWQgPSBmYWxzZTsKIAltbXB1dChobW0tPm1tKTsK
IAlobW1fcHV0KGhtbSk7Ci0JcmFuZ2UtPmhtbSA9IE5VTEw7CisKKwkvKiBUaGUgcmFuZ2UgaXMg
bm93IGludmFsaWQsIGxlYXZlIGl0IHBvaXNvbmVkLiAqLworCXJhbmdlLT52YWxpZCA9IGZhbHNl
OworCW1lbXNldCgmcmFuZ2UtPmhtbSwgUE9JU09OX0lOVVNFLCBzaXplb2YocmFuZ2UtPmhtbSkp
OwogfQogRVhQT1JUX1NZTUJPTChobW1fcmFuZ2VfdW5yZWdpc3Rlcik7CiAKLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
