Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B563B6DD
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CBC891D6;
	Mon, 10 Jun 2019 14:08:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1F689A14
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 20:49:31 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j19so3846688qtr.12
 for <amd-gfx@lists.freedesktop.org>; Fri, 07 Jun 2019 13:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=xpue/yTKTfw/egd/V5x6eR0dUTrWX63mNojFgXXVaNY=;
 b=NMQzAxPR6YeAUPfjgeW8cRAVgvesfWtLCaQ3icIXwfT1Fb/f8/nw4VUSUw0X1jiwKZ
 1TN/nh0ATXBnzDavQ9DVdMu7D7rDcTH+hkLLeJDYJrKngfB8vgCDpovrE0kyxkvb0MkT
 EH99hkNm5RIbF9bF9CuT3YYm95aCIA1FHs1A1zBKbl53g+BTXtVb1fD/EJ/ajrT4YEl5
 46L1ytggKZJoIG1FGsLEBrT91QOTsM/51RIxVVpfLOw52sMnnrYuoMQLogxB1qtgI+J1
 A3WvDtIJFat1IO12YoQ62vYRXny9qJ0DcXdf+dPvtHkQVTAEtQulDpiZPBAYBU80Mlh/
 5znQ==
X-Gm-Message-State: APjAAAVZfcc5lYU303LKZ9toK6VV3sHKtA0vRI6hxl403Cotl47ihE8C
 PrsBNvJFLN6DTGwB86Yth33VbQ==
X-Google-Smtp-Source: APXvYqzPKIbGhJdstJ73Gy3kLdTzS56fHmRoDPMXyiprmrDID4cHA2htBZhMjn4/4PIp+2lgQ2jdNg==
X-Received: by 2002:ac8:3325:: with SMTP id t34mr44082999qta.172.1559940571006; 
 Fri, 07 Jun 2019 13:49:31 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id b66sm1666176qkd.37.2019.06.07.13.49.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 13:49:30 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZLnm-0001TA-75; Fri, 07 Jun 2019 17:49:30 -0300
Date: Fri, 7 Jun 2019 17:49:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 hmm 09/11] mm/hmm: Poison hmm_range during unregister
Message-ID: <20190607204930.GV14802@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-10-jgg@ziepe.ca>
 <96a2739f-6902-05be-7143-289b41c4304d@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96a2739f-6902-05be-7143-289b41c4304d@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 10 Jun 2019 14:08:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=xpue/yTKTfw/egd/V5x6eR0dUTrWX63mNojFgXXVaNY=;
 b=XXE969tPj//9W51VkE9buoc1JR7bmeVIhDAenkig2qDcQeGQ9MQNdB4210YOgBQ6Ee
 urj3N09P7L5Mjvi4xbXHFj8HKfPprYKq7M7k/EcjofeMB2GoxEsuqBmDRxsipmPauBqe
 JJ48ov9QD+JiHQdqD9ykoXBcB6idhYNIBBpzZJ3zljvLxzfdUEHW6WPXsiiOISOg1mj6
 7DBax0TlpUXdzKzMpIHUKAbPg2PH7L5VNttRwq2gKh2xi8KiWg94GJWmCGzV9d7EA4dS
 T2I4WYqCFPx5kBGsqWXqkhkJCYicSNB5CNfx8sekAbHUUM1GtLdieXZWKGLrM/mxrLUx
 C/1Q==
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
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDE6NDY6MzBQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gCj4gT24gNi82LzE5IDExOjQ0IEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4g
PiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gPiAKPiA+IFRyeWlu
ZyB0byBtaXN1c2UgYSByYW5nZSBvdXRzaWRlIGl0cyBsaWZldGltZSBpcyBhIGtlcm5lbCBidWcu
IFVzZSBXQVJOX09OCj4gPiBhbmQgcG9pc29uIGJ5dGVzIHRvIGRldGVjdCB0aGlzIGNvbmRpdGlv
bi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3gu
Y29tPgo+ID4gUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29t
Pgo+IAo+IFJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+
Cj4gCj4gPiB2Mgo+ID4gLSBLZWVwIHJhbmdlIHN0YXJ0L2VuZCB2YWxpZCBhZnRlciB1bnJlZ2lz
dHJhdGlvbiAoSmVyb21lKQo+ID4gICBtbS9obW0uYyB8IDcgKysrKystLQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwo+ID4gaW5kZXggNjgwMmRlNzA4MGQxNzIuLmMyZmVj
YjNlY2IxMWUxIDEwMDY0NAo+ID4gKysrIGIvbW0vaG1tLmMKPiA+IEBAIC05MzcsNyArOTM3LDcg
QEAgdm9pZCBobW1fcmFuZ2VfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiA+
ICAgCXN0cnVjdCBobW0gKmhtbSA9IHJhbmdlLT5obW07Cj4gPiAgIAkvKiBTYW5pdHkgY2hlY2sg
dGhpcyByZWFsbHkgc2hvdWxkIG5vdCBoYXBwZW4uICovCj4gPiAtCWlmIChobW0gPT0gTlVMTCB8
fCByYW5nZS0+ZW5kIDw9IHJhbmdlLT5zdGFydCkKPiA+ICsJaWYgKFdBUk5fT04ocmFuZ2UtPmVu
ZCA8PSByYW5nZS0+c3RhcnQpKQo+ID4gICAJCXJldHVybjsKPiAKPiBXQVJOX09OKCkgaXMgZGVm
aW5pdGVseSBiZXR0ZXIgdGhhbiBzaWxlbnQgcmV0dXJuIGJ1dCBJIHdvbmRlciBob3cKPiB1c2Vm
dWwgaXQgaXMgc2luY2UgdGhlIGNhbGxlciBzaG91bGRuJ3QgYmUgbW9kaWZ5aW5nIHRoZSBobW1f
cmFuZ2UKPiBvbmNlIGl0IGlzIHJlZ2lzdGVyZWQuIE90aGVyIGZpZWxkcyBjb3VsZCBiZSBjaGFu
Z2VkIHRvby4uLgoKSSBkZWxldGVkIHRoZSB3YXJuIG9uIChzZWUgdGhlIG90aGVyIHRocmVhZCks
IGJ1dCBJJ20gY29uZnVzZWQgYnkgeW91ciAKInNob3VsZG4ndCBiZSBtb2RpZmllZCIgc3RhdGVt
ZW50LgoKVGhlIG9ubHkgdGhpbmcgdGhhdCBuZWVkcyB0byBiZSBzZXQgYW5kIHJlbWFpbiB1bmNo
YW5nZWQgZm9yIHJlZ2lzdGVyCmlzIHRoZSB2aXJ0dWFsIHN0YXJ0L2VuZCBhZGRyZXNzLiBFdmVy
eXRoaW5nIGVsc2Ugc2hvdWxkIGJlIGRvbmUgb25jZQppdCBpcyBjbGVhciB0byBwcm9jZWVkIGJh
c2VkIG9uIHRoZSBjb2xsaXNpb24tcmV0cnkgbG9ja2luZyBzY2hlbWUKdGhpcyB1c2VzLgoKQmFz
aWNhbGx5IHRoZSByYW5nZSByZWdpc3RlciBvbmx5IHNldHVwcyBhICdkZXRlY3RvcicgZm9yIGNv
bGxpZGluZwppbnZhbGlkYXRpb25zLiBUaGUgb3RoZXIgc3R1ZmYgaW4gdGhlIHN0cnVjdCBpcyBq
dXN0IHJhbmRvbSB0ZW1wb3JhcnkKc3RvcmFnZSBmb3IgdGhlIEFQSS4KCkFGQUlDUyBhdCBsZWFz
dC4uCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
