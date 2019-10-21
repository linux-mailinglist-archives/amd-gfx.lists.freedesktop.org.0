Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46DFDFE6C
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 09:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762AE6E413;
	Tue, 22 Oct 2019 07:40:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FA96E165;
 Mon, 21 Oct 2019 15:56:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Oct 2019 08:56:10 -0700
X-IronPort-AV: E=Sophos;i="5.67,324,1566889200"; d="scan'208";a="191149938"
Received: from ddalessa-mobl.amr.corp.intel.com (HELO [10.254.201.232])
 ([10.254.201.232])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 21 Oct 2019 08:56:08 -0700
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
References: <20191015181242.8343-1-jgg@ziepe.ca>
From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Message-ID: <5fdbcda8-c6ec-70aa-3f89-147fe67152f2@intel.com>
Date: Mon, 21 Oct 2019 11:55:51 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015181242.8343-1-jgg@ziepe.ca>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 22 Oct 2019 07:40:30 +0000
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
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMTAvMTUvMjAxOSAyOjEyIFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gVGhpcyBpcyBz
dGlsbCBiZWluZyB0ZXN0ZWQsIGJ1dCBJIGZpZ3VyZWQgdG8gc2VuZCBpdCB0byBzdGFydCBnZXR0
aW5nIGhlbHAKPiBmcm9tIHRoZSB4ZW4sIGFtZCBhbmQgaGZpIGRyaXZlcnMgd2hpY2ggSSBjYW5u
b3QgdGVzdCBoZXJlLgoKU29ycnkgZm9yIHRoZSBkZWxheSwgSSBuZXZlciBzZWVuIHRoaXMuIFdh
cyBub3Qgb24gQ2MgbGlzdCBhbmQgZGlkbid0IApyZWdpc3RlciB0byBtZSBpdCBpbXBhY3RlZCBo
ZmkuIEknbGwgdGFrZSBhIGxvb2sgYW5kIHJ1biBpdCB0aHJvdWdoIHNvbWUgCmhmaTEgdGVzdHMu
CgotRGVubnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
