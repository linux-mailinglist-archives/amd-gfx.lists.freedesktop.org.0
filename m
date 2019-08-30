Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B53A36FB
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 14:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1909E6E31A;
	Fri, 30 Aug 2019 12:43:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE44B89F97
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 01:30:01 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id u141so1850619ywe.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 18:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yDmQxANGbqTJGtO1OhTa4PkciZSXcUVcA6Y2VnUF5Ug=;
 b=NLJKGVwKTP2pPFB6lSJn5A2CBZm3VwF0WWB/kTEteZgWABaM7TkAMYS2jeybhZYHsW
 dn2jlob1i9Co0jJ8b9BThXC4uJs6Ky63tE/5x5nI/qEIq7n6wCsdG4DIZSGVVTIbqQKI
 9SRdH/6Ry8D03l9pXlB2KRVRy3HWrRspnswydnC25WbqM5TyzcSflhSzjmkAmB8lXxpp
 fM38zjzd7f1fCy5z3Py6U4yymFJ2+XtbV+1S8dBFpAXlzuVE+Q8P/mDnj6KNk8wBu5Ay
 ViTBnFKuwiJwTZGx7ANkw5p4DlIp3seeGlzvQEsvVFLb8lVKRPvuyzmkcisxj3OrPXia
 g/ag==
X-Gm-Message-State: APjAAAWvznvWc3yYpGjljJ+qGdRoWgCdEVRlBQWDY3cZ+4Q9PULr8dxJ
 8e/Mx7ohza1dv5u3UQrRzcP7Pc3mLC0IHZSUMusJ4w==
X-Google-Smtp-Source: APXvYqyIDKOrxjb28zWL9kagM4gqNHMvZYp0EWQP/d+eBC6/dEWbXTKwXclpCyHxrYDHzsr0mwrMijbohn/hHGTlziQ=
X-Received: by 2002:a81:3681:: with SMTP id d123mr9802172ywa.348.1567128600919; 
 Thu, 29 Aug 2019 18:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190807013340.9706-1-jhubbard@nvidia.com>
 <912eb2bd-4102-05c1-5571-c261617ad30b@nvidia.com>
In-Reply-To: <912eb2bd-4102-05c1-5571-c261617ad30b@nvidia.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Thu, 29 Aug 2019 21:29:50 -0400
Message-ID: <CAOg9mSQKGDywcMde2DE42diUS7J8m74Hdv+xp_PJhC39EXZQuw@mail.gmail.com>
Subject: Re: [PATCH v3 00/39] put_user_pages(): miscellaneous call sites
To: John Hubbard <jhubbard@nvidia.com>
X-Mailman-Approved-At: Fri, 30 Aug 2019 12:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yDmQxANGbqTJGtO1OhTa4PkciZSXcUVcA6Y2VnUF5Ug=;
 b=tRuQF9NGsWriwh9rOUGWV/XnpvxEIfrIBLDnzsNlL2DcXYptI5uYx9v9XRgXG9ikj+
 lAdRFBmN8WWgzpxjYwMBvOBMGH9vQkyzn/bAHiywFTqTy8Rv0zmy7NK3LdyKNjjgvNdr
 mcLlIarH9lbZWT5t7oU7MIVWXKIhgWd4FFEn+XvtJUHOlIO0rItLGA+Zt6tlzfYijXTt
 MmEvGy0xnlwDGgt/OUq/OkC9egtS+p7sT3eJ3BcAb9vNf6OatXnbSWZ0hHXVonsgbMVH
 pMy2zHMasv+EgzYrXDb3idQdrvXUOVYyNS1FKC2EzXUecfAda8U+O/uwCTXSTJ6SOTSm
 T3ow==
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm <linux-mm@kvack.org>,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, john.hubbard@gmail.com,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel <ceph-devel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgSm9obi4uLgoKSSBhZGRlZCB0aGlzIHBhdGNoIHNlcmllcyBvbiB0b3Agb2YgTGludXggNS4z
cmM2IGFuZCByYW4KeGZzdGVzdHMgd2l0aCBubyByZWdyZXNzaW9ucy4uLgoKQWNrZWQtYnk6IE1p
a2UgTWFyc2hhbGwgPGh1YmNhcEBvbW5pYm9uZC5jb20+CgotTWlrZQoKT24gVHVlLCBBdWcgNiwg
MjAxOSBhdCA5OjUwIFBNIEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4gd3JvdGU6
Cj4KPiBPbiA4LzYvMTkgNjozMiBQTSwgam9obi5odWJiYXJkQGdtYWlsLmNvbSB3cm90ZToKPiA+
IEZyb206IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiA+IC4uLgo+ID4KPiA+
IEpvaG4gSHViYmFyZCAoMzgpOgo+ID4gICBtbS9ndXA6IGFkZCBtYWtlX2RpcnR5IGFyZyB0byBw
dXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCkKPiAuLi4KPiA+ICA1NCBmaWxlcyBjaGFuZ2VkLCAx
OTEgaW5zZXJ0aW9ucygrKSwgMzIzIGRlbGV0aW9ucygtKQo+ID4KPiBhaGVtLCB5ZXMsIGFwcGFy
ZW50bHkgdGhpcyBpcyB3aGF0IGhhcHBlbnMgaWYgSSBhZGQgYSBmZXcgcGF0Y2hlcyB3aGlsZSBl
ZGl0aW5nCj4gdGhlIGNvdmVyIGxldHRlci4uLiA6KQo+Cj4gVGhlIHN1YmplY3QgbGluZSBzaG91
bGQgcmVhZCAiMDAvNDEiLCBhbmQgdGhlIGxpc3Qgb2YgZmlsZXMgYWZmZWN0ZWQgaGVyZSBpcwo+
IHRoZXJlZm9yZSB1bmRlci1yZXBvcnRlZCBpbiB0aGlzIGNvdmVyIGxldHRlci4gSG93ZXZlciwg
dGhlIHBhdGNoIHNlcmllcyBpdHNlbGYgaXMKPiBpbnRhY3QgYW5kIHJlYWR5IGZvciBzdWJtaXNz
aW9uLgo+Cj4gdGhhbmtzLAo+IC0tCj4gSm9obiBIdWJiYXJkCj4gTlZJRElBCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
