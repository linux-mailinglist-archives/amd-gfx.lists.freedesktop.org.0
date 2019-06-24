Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B2151CD6
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 23:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3105D89E03;
	Mon, 24 Jun 2019 21:08:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11FE89DE5
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 21:02:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d18so15393958wrs.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 14:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2HyibpLykYkiKTwGwDVDE6Jz0uAzR58LFXlNi/YRy3U=;
 b=je9FczLiXPndfbAfObgoXkcWNzMaDrsvCcmJ9rX9lE55ZEmyH0fN7iaoUlHPMjobeN
 Iq55ONOPrTYFfpVHyVJ1hycZsBbL62h7sIYJiCj+QoT58CTgbwKxtedF1hk7RuGcMggW
 lX2Cz7ml95Wzsm3BQC9867Hla58puUhhQ1wryL1583dvfByVsxml92hnTyh653UooVhZ
 jL9gJMCwH4EB9Sa1URlNNUlGlLowR0UAVG4rca2+dkoPdh8reSpkQxgxeGMsTeEVoVY/
 c/uOAq2oFDs83AnOpig556Ol2JXwp06AHwKFOhqjkVvHyF72cXPckDdZiB3NcgABABVx
 u0Aw==
X-Gm-Message-State: APjAAAUlucg4+eiL8r8mtW3oOPvLQE1O+tzKCqt2368cnhSUNit7JvnH
 uTIwgKyFx/+nH0y+HZJucsKqgw==
X-Google-Smtp-Source: APXvYqxbykTnskxCEk6vJXnhGhJhL+Hc/YVg3s4yNHZO6Rq1Ef69wTB8s8QzzXVmzALZYfvIEAb5sA==
X-Received: by 2002:adf:fa4c:: with SMTP id y12mr96903628wrr.282.1561410123670; 
 Mon, 24 Jun 2019 14:02:03 -0700 (PDT)
Received: from ziepe.ca ([66.187.232.66])
 by smtp.gmail.com with ESMTPSA id x11sm469693wmg.23.2019.06.24.14.02.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 14:02:02 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hfW6D-0001Mb-0S; Mon, 24 Jun 2019 18:02:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v4 hmm 08/12] mm/hmm: Use lockdep instead of comments
Date: Mon, 24 Jun 2019 18:01:06 -0300
Message-Id: <20190624210110.5098-9-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624210110.5098-1-jgg@ziepe.ca>
References: <20190624210110.5098-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Jun 2019 21:08:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2HyibpLykYkiKTwGwDVDE6Jz0uAzR58LFXlNi/YRy3U=;
 b=o/tFvhN275Le/5WQ2vu2fc7dpnfllCtch7SunXoc0gfrceioMrV84vJNXj3fcaoXjc
 qKdfy6+FErMOpWLLywUqcU/CCvqkzz60BPZVTd/0tIIXWv44kB8+wkXkIP3fIfmQuRfU
 VCtdLewh0B23U6TTG5KtYq7rxUdtI/n6yUmErMCpp/rXPr3h474Gd7GbjYQ+iiDYdpy1
 7shV4eVpmV49XoNejllG2+McGSuy2k7ZkrwJwBNEK6NQF3+JDLsqVqku3k4UUdsaGuab
 CgCCYDDWmuYZ06PXgv5ghP0Ro725vIEY+j0ePamWI4Lrm/GuhZ/Rebt3wxbycRP+uaHI
 i7Cw==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Souptick Joarder <jrdr.linux@gmail.com>, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKU28gd2UgY2FuIGNoZWNr
IGxvY2tpbmcgYXQgcnVudGltZS4KClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdn
QG1lbGxhbm94LmNvbT4KUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRo
YXQuY29tPgpSZXZpZXdlZC1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgpS
ZXZpZXdlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpBY2tlZC1i
eTogU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KVGVzdGVkLWJ5OiBQaGlsaXAgWWFuZyA8UGhp
bGlwLllhbmdAYW1kLmNvbT4KLS0tCnYyCi0gRml4IG1pc3NpbmcgJiBpbiBsb2NrZGVwcyAoSmFz
b24pCi0tLQogbW0vaG1tLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRl
eCAxZWRkZGE0NWNlZmFlNy4uNmY1ZGM2ZDU2OGZlYjEgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisr
KyBiL21tL2htbS5jCkBAIC0yNDYsMTEgKzI0NiwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1t
dV9ub3RpZmllcl9vcHMgaG1tX21tdV9ub3RpZmllcl9vcHMgPSB7CiAgKgogICogVG8gc3RhcnQg
bWlycm9yaW5nIGEgcHJvY2VzcyBhZGRyZXNzIHNwYWNlLCB0aGUgZGV2aWNlIGRyaXZlciBtdXN0
IHJlZ2lzdGVyCiAgKiBhbiBITU0gbWlycm9yIHN0cnVjdC4KLSAqCi0gKiBUSEUgbW0tPm1tYXBf
c2VtIE1VU1QgQkUgSEVMRCBJTiBXUklURSBNT0RFICEKICAqLwogaW50IGhtbV9taXJyb3JfcmVn
aXN0ZXIoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwgc3RydWN0IG1tX3N0cnVjdCAqbW0pCiB7
CisJbG9ja2RlcF9hc3NlcnRfaGVsZF9leGNsdXNpdmUoJm1tLT5tbWFwX3NlbSk7CisKIAkvKiBT
YW5pdHkgY2hlY2sgKi8KIAlpZiAoIW1tIHx8ICFtaXJyb3IgfHwgIW1pcnJvci0+b3BzKQogCQly
ZXR1cm4gLUVJTlZBTDsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
