Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DBF84238
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 04:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C319A6E5BC;
	Wed,  7 Aug 2019 02:16:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7BD6E57A
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 23:16:15 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id u190so696851qkh.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 06 Aug 2019 16:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=evI7jo74G4Gx7Gga7ZV8g3f7D3AhHv7OMI4oYy7KjpQ=;
 b=lrDAVhFteFtxj6yxuh/mJMmJj4NcJ5pkIxIvaVFllwVKp09D/1zYJIEYhI0BVyftAx
 GEh60FtYKBJDOu5GKzRUPSCoxTfa3lBCreH3osvJJoJ3SBM8Wfr1DJBw+TF9GzeELZyT
 5xNY9Svx8xYDf5aiCkgLGU92vJBC3alYdf5pe2pIFl2D1RZzqxFgbDBq/RJLKZGoOiNv
 ipRY2KHPiP+6pXBnnSCXGN3aBiO4rh5J67P/vmlRlhlGERcGHqE0qI3Ik0I7CNVFdue5
 sgpimd2BWCmcpWw86LqXuOt1qjRH7RiRv/lWsQpb0PUk6FgjCDo+LgzXQAC1ZMn+hZAW
 TTOA==
X-Gm-Message-State: APjAAAWDpueFkV29eInn6LcZp2YZlhKD6ZcChgFfoHOckSwQMXV+bYDL
 Jdms8dZlmw7ut6DEwIcLZfX4eQ==
X-Google-Smtp-Source: APXvYqylqTmNzPQYqTYhRiwrI4AtCqibIZpw6EBPoIBj42tnctW/9AiKc7I50IcPqwnV2QCyiSKRxQ==
X-Received: by 2002:a37:660d:: with SMTP id a13mr5780388qkc.36.1565133374824; 
 Tue, 06 Aug 2019 16:16:14 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id f22sm35086171qkk.45.2019.08.06.16.16.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 16:16:14 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv8gg-0006eG-0j; Tue, 06 Aug 2019 20:16:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org
Subject: [PATCH v3 hmm 01/11] mm/mmu_notifiers: hoist do_mmu_notifier_register
 down_write to the caller
Date: Tue,  6 Aug 2019 20:15:38 -0300
Message-Id: <20190806231548.25242-2-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806231548.25242-1-jgg@ziepe.ca>
References: <20190806231548.25242-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Aug 2019 02:16:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=evI7jo74G4Gx7Gga7ZV8g3f7D3AhHv7OMI4oYy7KjpQ=;
 b=MzTXpv/RThZvTM0oekrE0HbJIq9MDfLDK/pFUY/Kg6pyTj13D+sPiKCI/dSGwPAxpY
 66cmu6NttsKhYSMYlnguyr7uhmgAbn3zoEecwJHbFK40+26VHkYuF99AdRjGXrECGqPh
 vtfbOQsp5XxERMNpAIlGBC0fNvBHCI4Xe9NbY9LiKeaS2gZSeE7ortCdr7AwymC1bQMf
 tH8isbUtYa12pesEmXPJTyySS7DaU/IrFA7s+yY18pgcvmsoF40zJdJl86bWxSpitktu
 59wGxHKZqUMMqNyx4DORY6ozb2JQGWE2AME4lSBAP89G+fxJ+NZfrKn08DfZpc+bITKO
 VTAg==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Dimitri Sivanich <sivanich@sgi.com>,
 Gavin Shan <shangw@linux.vnet.ibm.com>, Andrea Righi <andrea@betterlinux.com>,
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@mellanox.com>, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhpcyBzaW1wbGlmaWVz
IHRoZSBjb2RlIHRvIG5vdCBoYXZlIHNvIG1hbnkgb25lIGxpbmUgZnVuY3Rpb25zIGFuZCBleHRy
YQpsb2dpYy4gX19tbXVfbm90aWZpZXJfcmVnaXN0ZXIoKSBzaW1wbHkgYmVjb21lcyB0aGUgZW50
cnkgcG9pbnQgdG8KcmVnaXN0ZXIgdGhlIG5vdGlmaWVyLCBhbmQgdGhlIG90aGVyIG9uZSBjYWxs
cyBpdCB1bmRlciBsb2NrLgoKQWxzbyBhZGQgYSBsb2NrZGVwX2Fzc2VydCB0byBjaGVjayB0aGF0
IHRoZSBjYWxsZXJzIGFyZSBob2xkaW5nIHRoZSBsb2NrCmFzIGV4cGVjdGVkLgoKU3VnZ2VzdGVk
LWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+ClNpZ25lZC1vZmYtYnk6
IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KLS0tCiBtbS9tbXVfbm90aWZpZXIu
YyB8IDM1ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vbW11
X25vdGlmaWVyLmMgYi9tbS9tbXVfbm90aWZpZXIuYwppbmRleCBiNTY3MDYyMGFlYTBmYy4uMjE4
YTZmMTA4YmMyZDAgMTAwNjQ0Ci0tLSBhL21tL21tdV9ub3RpZmllci5jCisrKyBiL21tL21tdV9u
b3RpZmllci5jCkBAIC0yMzYsMjIgKzIzNiwyMiBAQCB2b2lkIF9fbW11X25vdGlmaWVyX2ludmFs
aWRhdGVfcmFuZ2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0sCiB9CiBFWFBPUlRfU1lNQk9MX0dQTChf
X21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlKTsKIAotc3RhdGljIGludCBkb19tbXVfbm90
aWZpZXJfcmVnaXN0ZXIoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sCi0JCQkJICAgIHN0cnVjdCBt
bV9zdHJ1Y3QgKm1tLAotCQkJCSAgICBpbnQgdGFrZV9tbWFwX3NlbSkKKy8qCisgKiBTYW1lIGFz
IG1tdV9ub3RpZmllcl9yZWdpc3RlciBidXQgaGVyZSB0aGUgY2FsbGVyIG11c3QgaG9sZCB0aGUK
KyAqIG1tYXBfc2VtIGluIHdyaXRlIG1vZGUuCisgKi8KK2ludCBfX21tdV9ub3RpZmllcl9yZWdp
c3RlcihzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwgc3RydWN0IG1tX3N0cnVjdCAqbW0pCiB7CiAJ
c3RydWN0IG1tdV9ub3RpZmllcl9tbSAqbW11X25vdGlmaWVyX21tOwogCWludCByZXQ7CiAKKwls
b2NrZGVwX2Fzc2VydF9oZWxkX3dyaXRlKCZtbS0+bW1hcF9zZW0pOwogCUJVR19PTihhdG9taWNf
cmVhZCgmbW0tPm1tX3VzZXJzKSA8PSAwKTsKIAotCXJldCA9IC1FTk9NRU07CiAJbW11X25vdGlm
aWVyX21tID0ga21hbGxvYyhzaXplb2Yoc3RydWN0IG1tdV9ub3RpZmllcl9tbSksIEdGUF9LRVJO
RUwpOwogCWlmICh1bmxpa2VseSghbW11X25vdGlmaWVyX21tKSkKLQkJZ290byBvdXQ7CisJCXJl
dHVybiAtRU5PTUVNOwogCi0JaWYgKHRha2VfbW1hcF9zZW0pCi0JCWRvd25fd3JpdGUoJm1tLT5t
bWFwX3NlbSk7CiAJcmV0ID0gbW1fdGFrZV9hbGxfbG9ja3MobW0pOwogCWlmICh1bmxpa2VseShy
ZXQpKQogCQlnb3RvIG91dF9jbGVhbjsKQEAgLTI3OSwxMyArMjc5LDExIEBAIHN0YXRpYyBpbnQg
ZG9fbW11X25vdGlmaWVyX3JlZ2lzdGVyKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLAogCiAJbW1f
ZHJvcF9hbGxfbG9ja3MobW0pOwogb3V0X2NsZWFuOgotCWlmICh0YWtlX21tYXBfc2VtKQotCQl1
cF93cml0ZSgmbW0tPm1tYXBfc2VtKTsKIAlrZnJlZShtbXVfbm90aWZpZXJfbW0pOwotb3V0Ogog
CUJVR19PTihhdG9taWNfcmVhZCgmbW0tPm1tX3VzZXJzKSA8PSAwKTsKIAlyZXR1cm4gcmV0Owog
fQorRVhQT1JUX1NZTUJPTF9HUEwoX19tbXVfbm90aWZpZXJfcmVnaXN0ZXIpOwogCiAvKgogICog
TXVzdCBub3QgaG9sZCBtbWFwX3NlbSBub3IgYW55IG90aGVyIFZNIHJlbGF0ZWQgbG9jayB3aGVu
IGNhbGxpbmcKQEAgLTMwMiwxOSArMzAwLDE0IEBAIHN0YXRpYyBpbnQgZG9fbW11X25vdGlmaWVy
X3JlZ2lzdGVyKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLAogICovCiBpbnQgbW11X25vdGlmaWVy
X3JlZ2lzdGVyKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkK
IHsKLQlyZXR1cm4gZG9fbW11X25vdGlmaWVyX3JlZ2lzdGVyKG1uLCBtbSwgMSk7Ci19Ci1FWFBP
UlRfU1lNQk9MX0dQTChtbXVfbm90aWZpZXJfcmVnaXN0ZXIpOworCWludCByZXQ7CiAKLS8qCi0g
KiBTYW1lIGFzIG1tdV9ub3RpZmllcl9yZWdpc3RlciBidXQgaGVyZSB0aGUgY2FsbGVyIG11c3Qg
aG9sZCB0aGUKLSAqIG1tYXBfc2VtIGluIHdyaXRlIG1vZGUuCi0gKi8KLWludCBfX21tdV9ub3Rp
Zmllcl9yZWdpc3RlcihzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwgc3RydWN0IG1tX3N0cnVjdCAq
bW0pCi17Ci0JcmV0dXJuIGRvX21tdV9ub3RpZmllcl9yZWdpc3RlcihtbiwgbW0sIDApOworCWRv
d25fd3JpdGUoJm1tLT5tbWFwX3NlbSk7CisJcmV0ID0gX19tbXVfbm90aWZpZXJfcmVnaXN0ZXIo
bW4sIG1tKTsKKwl1cF93cml0ZSgmbW0tPm1tYXBfc2VtKTsKKwlyZXR1cm4gcmV0OwogfQotRVhQ
T1JUX1NZTUJPTF9HUEwoX19tbXVfbm90aWZpZXJfcmVnaXN0ZXIpOworRVhQT1JUX1NZTUJPTF9H
UEwobW11X25vdGlmaWVyX3JlZ2lzdGVyKTsKIAogLyogdGhpcyBpcyBjYWxsZWQgYWZ0ZXIgdGhl
IGxhc3QgbW11X25vdGlmaWVyX3VucmVnaXN0ZXIoKSByZXR1cm5lZCAqLwogdm9pZCBfX21tdV9u
b3RpZmllcl9tbV9kZXN0cm95KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQotLSAKMi4yMi4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
