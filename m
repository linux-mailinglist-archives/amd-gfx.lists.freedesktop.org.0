Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6244566F
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 09:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85A789A20;
	Fri, 14 Jun 2019 07:32:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB333892F2
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 00:44:59 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c11so616808qkk.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Jun 2019 17:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x2xcZ0hUzEe5obPQKOQJn2EFwkT6zfHmS/ojlfdj62g=;
 b=kVJjaKNz834uJ0WnBFyZkwMPzqivRCYJpWKcYSYcwe+7jmssPwdRQ4f8Bo/DU+EdBo
 EUfH2/BNeattjEj3Mq5mPtqIPxMIc3qSBLxkWNtuec/pJqdCNCU9eeKNoB4FzU4gGoiV
 MddGH9GQZV5VmCM5hjsIa32ynAHi6q7FDzzxNrAIRXK4udw5Rn30PjLNl3MeEzhsSymN
 fA03QVmbYOP1QhlLWDWkqfhCJ4ZNY8tpz/xGQUpFo291Qeu7bndQehgtHwcf3rRkOuf7
 G/VZu4bNFCkto6AHnpJ4ShKUveaa7hDD/O94uo308Z07+2gJa368+ZOBz2HH5cuDstSf
 w9tQ==
X-Gm-Message-State: APjAAAVkAiBjUd+YAMh7B0Nu8p1eajL7lQhzjyvQLnhIoatRT3CrOdXq
 pWTZ63IGVk9W4Ui5+cTKOd0O+g==
X-Google-Smtp-Source: APXvYqzCPZOcBvdDvO5A/+aWYFKA+YngTOxLtxM859wIOaaSHbD/Xj8J7AD4AHMtWoKrqY+ZKezZsg==
X-Received: by 2002:a05:620a:1661:: with SMTP id
 d1mr13812583qko.192.1560473099006; 
 Thu, 13 Jun 2019 17:44:59 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id q56sm978355qtq.64.2019.06.13.17.44.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Jun 2019 17:44:54 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hbaKs-0005KQ-1j; Thu, 13 Jun 2019 21:44:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v3 hmm 10/12] mm/hmm: Do not use list*_rcu() for hmm->ranges
Date: Thu, 13 Jun 2019 21:44:48 -0300
Message-Id: <20190614004450.20252-11-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190614004450.20252-1-jgg@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:32:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x2xcZ0hUzEe5obPQKOQJn2EFwkT6zfHmS/ojlfdj62g=;
 b=fmkDVzgS2vVrdEiIFYVAnbf6P4BATGmI5DV7vsT+OeMjI4tAox+P6sovJkfdiZ77nO
 TT+3owVCCkhWvSGoSNguAk+3EcblRkw7UWgxiYOoQUIg3Krv9JVjCiJAQm/Z0vfo/EQO
 KilEhiFU8QK10vlLGWCYF1bTI+QT+GOn8FgfKnRlLwynY8K2mvFNbldzrI4Lge3bpnfB
 LwwdBdhl/qwje1Wf18PrfGX26/MhvkXIgT48JtyA/Mh0PWYhgZzhVUdAvgS8HFf+7d0p
 m4F365LJ+Y/0qG+JXDxYUTDe3aQRit0hcrauKtBkjsXKtLtzRJ2lxMjKyKDLXCmxU6K9
 9xfw==
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
 linux-rdma@vger.kernel.org, Ira Weiny <iweiny@intel.com>,
 amd-gfx@lists.freedesktop.org, Souptick Joarder <jrdr.linux@gmail.com>,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhpcyBsaXN0IGlzIGFs
d2F5cyByZWFkIGFuZCB3cml0dGVuIHdoaWxlIGhvbGRpbmcgaG1tLT5sb2NrIHNvIHRoZXJlIGlz
Cm5vIG5lZWQgZm9yIHRoZSBjb25mdXNpbmcgX3JjdSBhbm5vdGF0aW9ucy4KClNpZ25lZC1vZmYt
Ynk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KUmV2aWV3ZWQtYnk6IErDqXLD
tG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogSm9obiBIdWJiYXJk
IDxqaHViYmFyZEBudmlkaWEuY29tPgpBY2tlZC1ieTogU291cHRpY2sgSm9hcmRlciA8anJkci5s
aW51eEBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52
aWRpYS5jb20+CkFja2VkLWJ5OiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNv
bT4KUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXdlaW55QGludGVsLmNvbT4KVGVzdGVkLWJ5OiBQ
aGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4KLS0tCiBtbS9obW0uYyB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4IGUyMTQ2NjhjYmEzNDc0Li4yNmFmNTExY2Jk
ZDA3NSAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTkwOCw3ICs5MDgs
NyBAQCBpbnQgaG1tX3JhbmdlX3JlZ2lzdGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAogCiAJ
cmFuZ2UtPmhtbSA9IGhtbTsKIAlrcmVmX2dldCgmaG1tLT5rcmVmKTsKLQlsaXN0X2FkZF9yY3Uo
JnJhbmdlLT5saXN0LCAmaG1tLT5yYW5nZXMpOworCWxpc3RfYWRkKCZyYW5nZS0+bGlzdCwgJmht
bS0+cmFuZ2VzKTsKIAogCS8qCiAJICogSWYgdGhlcmUgYXJlIGFueSBjb25jdXJyZW50IG5vdGlm
aWVycyB3ZSBoYXZlIHRvIHdhaXQgZm9yIHRoZW0gZm9yCkBAIC05MzQsNyArOTM0LDcgQEAgdm9p
ZCBobW1fcmFuZ2VfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKIAlzdHJ1Y3Qg
aG1tICpobW0gPSByYW5nZS0+aG1tOwogCiAJbXV0ZXhfbG9jaygmaG1tLT5sb2NrKTsKLQlsaXN0
X2RlbF9yY3UoJnJhbmdlLT5saXN0KTsKKwlsaXN0X2RlbCgmcmFuZ2UtPmxpc3QpOwogCW11dGV4
X3VubG9jaygmaG1tLT5sb2NrKTsKIAogCS8qIERyb3AgcmVmZXJlbmNlIHRha2VuIGJ5IGhtbV9y
YW5nZV9yZWdpc3RlcigpICovCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
