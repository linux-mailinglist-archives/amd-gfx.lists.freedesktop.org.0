Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A831E40231
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 22:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBECC89218;
	Tue, 11 Jun 2019 20:33:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F3D891E3
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 19:49:00 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c11so8457828qkk.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 12:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dheT/EMDb4T+RApc8v8N2FtLE3hQvNF1jI6K4SKLtO8=;
 b=H3BVrO+yt/46BvpbySxcaQjEvS0BAoTM6gYhtVyo4wGky1FNLoSCW3oC9TwucW50QE
 yQ4eSFwN216mpYeEduFVA0n8FJMaVusZ17jyx+O9ytHNgXMMztbbk+kUII5E4smbr+Y9
 NXj4I2EmeD0HMnJmdEGRvNfXpe46P0wyTxvsewQ7xkSBfDrxhbg7LMZF2RjPC1JfOc5R
 qX50pwhNgvw7vy5On5V53InMnLO7f2vM4ogYIoV+UqPeqerIINQ4RVJ/dnlB94PLgk5n
 lRb70yL6bhlNkVU6MVM/CJvCpN2E7itV+pxyW5MNXenNeSzkbRo1bWad4+IVAqw8/DMS
 YfGg==
X-Gm-Message-State: APjAAAX50pd9pry5e7oHIq7n2HmRTF7Xi9GrSlmJ8+LUd9lCVJ8hm/sv
 Jy2nzB5LFYLX55Yefu02HbA9kg==
X-Google-Smtp-Source: APXvYqzWz4wQqQxqhco5IULXJcXk646whmpSr99hd3VvEKfBiD/jhjxF/rS3VyznrgwL7ykbqH0Z2w==
X-Received: by 2002:a37:de18:: with SMTP id h24mr7448842qkj.147.1560282539428; 
 Tue, 11 Jun 2019 12:48:59 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id g185sm3415686qkf.54.2019.06.11.12.48.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Jun 2019 12:48:59 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hamlO-0007GH-Lg; Tue, 11 Jun 2019 16:48:58 -0300
Date: Tue, 11 Jun 2019 16:48:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Felix.Kuehling@amd.com,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v2 hmm 00/11] Various revisions from a locking/code review
Message-ID: <20190611194858.GA27792@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606184438.31646-1-jgg@ziepe.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 11 Jun 2019 20:33:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dheT/EMDb4T+RApc8v8N2FtLE3hQvNF1jI6K4SKLtO8=;
 b=KARLerpzOvvIj3IeSArTupBFJwtO+dDGhTWToR4GRIOdhp5jyNWQH6gKAGwNJyiQ4U
 xCkP33zNk7FBLZe+Voo8dCCfx7wIB4dz2w5in+9dfr+0SUDLq0d7orxxPsoyNk3DtpJ4
 L9S3duKjQxW0McdT7XRm9Omr0K64Cpj09xwwLEanRjVh6IWFPsosaX+imndD2tPbPeQB
 FjnnbXv4dHkcKwvFZ+PCT06b9Jyb25/mybmzSoosPbMLQFcH82UhcYYjvkwHCRFFKaie
 nVhD3xpMNRX40iAA/yFNxeGBPVUFRysXuFmpx3gzh30qnakSYukbUtU4rsjR07o6ntSb
 +aSg==
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
Cc: linux-rdma@vger.kernel.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDM6NDQ6MjdQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBG
b3IgaG1tLmdpdDoKPiAKPiBUaGlzIHBhdGNoIHNlcmllcyBhcmlzZWQgb3V0IG9mIGRpc2N1c3Np
b25zIHdpdGggSmVyb21lIHdoZW4gbG9va2luZyBhdCB0aGUKPiBPRFAgY2hhbmdlcywgcGFydGlj
dWxhcmx5IGluZm9ybWVkIGJ5IHVzZSBhZnRlciBmcmVlIHJhY2VzIHdlIGhhdmUgYWxyZWFkeQo+
IGZvdW5kIGFuZCBmaXhlZCBpbiB0aGUgT0RQIGNvZGUgKHRoYW5rcyB0byBzeXprYWxsZXIpIHdv
cmtpbmcgd2l0aCBtbXUKPiBub3RpZmllcnMsIGFuZCB0aGUgZGlzY3Vzc2lvbiB3aXRoIFJhbHBo
IG9uIGhvdyB0byByZXNvbHZlIHRoZSBsaWZldGltZSBtb2RlbC4KPiAKPiBPdmVyYWxsIHRoaXMg
YnJpbmdzIGluIGEgc2ltcGxpZmllZCBsb2NraW5nIHNjaGVtZSBhbmQgZWFzeSB0byBleHBsYWlu
Cj4gbGlmZXRpbWUgbW9kZWw6Cj4gCj4gIElmIGEgaG1tX3JhbmdlIGlzIHZhbGlkLCB0aGVuIHRo
ZSBobW0gaXMgdmFsaWQsIGlmIGEgaG1tIGlzIHZhbGlkIHRoZW4gdGhlIG1tCj4gIGlzIGFsbG9j
YXRlZCBtZW1vcnkuCj4gCj4gIElmIHRoZSBtbSBuZWVkcyB0byBzdGlsbCBiZSBhbGl2ZSAoaWUg
dG8gbG9jayB0aGUgbW1hcF9zZW0sIGZpbmQgYSB2bWEsIGV0YykKPiAgdGhlbiB0aGUgbW1nZXQg
bXVzdCBiZSBvYnRhaW5lZCB2aWEgbW1nZXRfbm90X3plcm8oKS4KPiAKPiBMb2NraW5nIG9mIG1t
LT5obW0gaXMgc2hpZnRlZCB0byB1c2UgdGhlIG1tYXBfc2VtIGNvbnNpc3RlbnRseSBmb3IgYWxs
Cj4gcmVhZC93cml0ZSBhbmQgdW5sb2NrZWQgYWNjZXNzZXMgYXJlIHJlbW92ZWQuCj4gCj4gVGhl
IHVzZSB1bmxvY2tlZCByZWFkcyBvbiAnaG1tLT5kZWFkJyBhcmUgYWxzbyBlbGltaW5hdGVkIGlu
IGZhdm91ciBvZiB1c2luZwo+IHN0YW5kYXJkIG1tZ2V0KCkgbG9ja2luZyB0byBwcmV2ZW50IHRo
ZSBtbSBmcm9tIGJlaW5nIHJlbGVhc2VkLiBNYW55IG9mIHRoZQo+IGRlYnVnZ2luZyBjaGVja3Mg
b2YgIXJhbmdlLT5obW0gYW5kICFobW0tPm1tIGFyZSBkcm9wcGVkIGluIGZhdm91ciBvZiBwb2lz
b24gLQo+IHdoaWNoIGlzIG11Y2ggY2xlYXJlciBhcyB0byB0aGUgbGlmZXRpbWUgaW50ZW50Lgo+
IAo+IFRoZSB0cmFpbGluZyBwYXRjaGVzIGFyZSBqdXN0IHNvbWUgcmFuZG9tIGNsZWFudXBzIEkg
bm90aWNlZCB3aGVuIHJldmlld2luZwo+IHRoaXMgY29kZS4KPiAKPiBUaGlzIHYyIGluY29ycG9y
YXRlcyBhbG90IG9mIHRoZSBnb29kIG9mZiBsaXN0IGNoYW5nZXMgJiBmZWVkYmFjayBKZXJvbWUg
aGFkLAo+IGFuZCBhbGwgdGhlIG9uLWxpc3QgY29tbWVudHMgdG9vLiBIb3dldmVyLCBub3cgdGhh
dCB3ZSBoYXZlIHRoZSBzaGFyZWQgZ2l0IEkKPiBoYXZlIGtlcHQgdGhlIG9uZSBsaW5lIGNoYW5n
ZSB0byBub3V2ZWF1X3N2bS5jIHJhdGhlciB0aGFuIHRoZSBjb21wYXQKPiBmdW50aW9ucy4KPiAK
PiBJIGJlbGlldmUgd2UgY2FuIHJlc29sdmUgdGhpcyBtZXJnZSBpbiB0aGUgRFJNIHRyZWUgbm93
IGFuZCBrZWVwIHRoZSBjb3JlCj4gbW0vaG1tLmMgY2xlYW4uIERSTSBtYWludGFpbmVycywgcGxl
YXNlIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nLgo+IAo+IEl0IGlzIG9uIHRvcCBvZiBobW0uZ2l0
LCBhbmQgSSBoYXZlIGEgZ2l0IHRyZWUgb2YgdGhpcyBzZXJpZXMgdG8gZWFzZSB0ZXN0aW5nCj4g
aGVyZToKPiAKPiBodHRwczovL2dpdGh1Yi5jb20vamd1bnRob3JwZS9saW51eC90cmVlL2htbQo+
IAo+IFRoZXJlIGFyZSBzdGlsbCBzb21lIG9wZW4gbG9ja2luZyBpc3N1ZXMsIGFzIEkgdGhpbmsg
dGhpcyByZW1haW5zIHVuYWRkcmVzc2VkOgo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LW1tLzIwMTkwNTI3MTk1ODI5LkdCMTgwMTlAbWVsbGFub3guY29tLwo+IAo+IEknbSBsb29r
aW5nIGZvciBzb21lIG1vcmUgYWNrcywgcmV2aWV3cyBhbmQgdGVzdHMgc28gdGhpcyBjYW4gbW92
ZSBhaGVhZCB0bwo+IGhtbS5naXQuCgpBTUQgRm9sa3MsIHRoaXMgaXMgbG9va2luZyBwcmV0dHkg
Z29vZCBub3csIGNhbiB5b3UgcGxlYXNlIGdpdmUgYXQKbGVhc3QgYSBUZXN0ZWQtYnkgZm9yIHRo
ZSBuZXcgZHJpdmVyIGNvZGUgdXNpbmcgdGhpcyB0aGF0IEkgc2VlIGluCmxpbnV4LW5leHQ/CgpU
aGFua3MsCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
