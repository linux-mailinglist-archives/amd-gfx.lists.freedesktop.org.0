Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2654FE8878
	for <lists+amd-gfx@lfdr.de>; Tue, 29 Oct 2019 13:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD906E2CD;
	Tue, 29 Oct 2019 12:42:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869486E249;
 Tue, 29 Oct 2019 12:15:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 05:15:05 -0700
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="203546862"
Received: from ddalessa-mobl.amr.corp.intel.com (HELO [10.254.206.224])
 ([10.254.206.224])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 29 Oct 2019 05:15:02 -0700
Subject: Re: [PATCH hmm 06/15] RDMA/hfi1: Use mmu_range_notifier_inset for
 user_exp_rcv
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <20191015181242.8343-7-jgg@ziepe.ca>
From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Message-ID: <fbe0ba5a-916b-c631-3faa-74f18909643c@intel.com>
Date: Tue, 29 Oct 2019 08:15:00 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015181242.8343-7-jgg@ziepe.ca>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 29 Oct 2019 12:42:32 +0000
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
 Mike Marciniszyn <mike.marciniszyn@intel.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMTAvMTUvMjAxOSAyOjEyIFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gRnJvbTogSmFz
b24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IFRoaXMgY29udmVydHMgb25lIG9m
IHRoZSB0d28gdXNlcnMgb2YgbW11X25vdGlmaWVycyB0byB1c2UgdGhlIG5ldyBBUEkuCj4gVGhl
IGNvbnZlcnNpb24gaXMgZmFpcmx5IHN0cmFpZ2h0Zm9yd2FyZCwgaG93ZXZlciB0aGUgZXhpc3Rp
bmcgdXNlIG9mCj4gbm90aWZpZXJzIGhlcmUgc2VlbXMgdG8gYmUgcmFjZXkuCj4gCj4gQ2M6IE1p
a2UgTWFyY2luaXN6eW4gPG1pa2UubWFyY2luaXN6eW5AaW50ZWwuY29tPgo+IENjOiBEZW5uaXMg
RGFsZXNzYW5kcm8gPGRlbm5pcy5kYWxlc3NhbmRyb0BpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVHlwbyBpbiBzdWJqZWN0IHMv
aW5zZXQvaW5zZXJ0LgoKVGVzdGVkLWJ5OiBEZW5uaXMgRGFsZXNzYW5kcm8gPGRlbm5pcy5kYWxl
c3NhbmRyb0BpbnRlbC5jb20+CgpUaGFua3MKCi1EZW5ueQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
