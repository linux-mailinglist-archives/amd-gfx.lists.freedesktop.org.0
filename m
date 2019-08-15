Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 087C38F8AD
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 03:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1A86EAAF;
	Fri, 16 Aug 2019 01:56:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6C36EA76
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 20:47:25 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id e12so7605891otp.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 13:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iGCSUcgObYGVRCAzYsit2AWDPyDTFFk4jtMiYAkxFvg=;
 b=gFrIB4vKNNb04PfvSGXTmnLKMvF/6VDQ+4TU7op7sNn8e+GFktdfziLJQKF6dmyW2g
 oe8wSah08wty5g/GqBBlhiov/8BcDLulzspkCwSBUIbRaRcJAkBXssytmIZVC1CU0w4S
 SfKG8U+o+Gww9hdJMeCxWyArib0ZWAhR2SrAK1y8IecrZYBKuViTisB9TkBZ0qOgUOck
 B/lWc8niX4zKj+5b2g35CTF358S0eduSWth6cAC1LtohD29fBeeJE4aJoTAaI17sohSb
 u0bvn9drgDXbaWA2a2uMbRHevSvhRgpoStuxI+eVBScnnVDd9FMtCSViKGWdCCDe5+Um
 74Fw==
X-Gm-Message-State: APjAAAX9TQo8Rp8CMSgIzgaOmTOnV99QuP2pBfa5EHmCUSHUivIpWcQg
 xon7l4Z8Sl7NWyz/EY2Du6l/uLYW1JeZ6J0+NxEpJB5YQIY=
X-Google-Smtp-Source: APXvYqxd1d1qB7OEUrQO74IOC/HKBdhosqv4dkigmxMbJWq9zPu2Tf40r+CLgutNYrcVuSBFfg5oXWWZglhJSMHeq3k=
X-Received: by 2002:a05:6830:458:: with SMTP id
 d24mr4706447otc.126.1565902044326; 
 Thu, 15 Aug 2019 13:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190808065933.GA29382@lst.de>
 <CAPcyv4hMUzw8vyXFRPe2pdwef0npbMm9tx9wiZ9MWkHGhH1V6w@mail.gmail.com>
 <20190814073854.GA27249@lst.de> <20190814132746.GE13756@mellanox.com>
 <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
 <20190815180325.GA4920@redhat.com>
 <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
 <20190815194339.GC9253@redhat.com>
 <CAPcyv4jid8_=-8hBpn_Qm=c4S8BapL9B9RGT7e9uu303yH=Yqw@mail.gmail.com>
 <20190815203306.GB25517@redhat.com> <20190815204128.GI22970@mellanox.com>
In-Reply-To: <20190815204128.GI22970@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 15 Aug 2019 13:47:12 -0700
Message-ID: <CAPcyv4j_Mxbw+T+yXTMdkrMoS_uxg+TXXgTM_EPBJ8XfXKxytA@mail.gmail.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Approved-At: Fri, 16 Aug 2019 01:56:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iGCSUcgObYGVRCAzYsit2AWDPyDTFFk4jtMiYAkxFvg=;
 b=Xs91eNvCSOxAfiys1ppgNPaq0ALSevQ/T2i3xlUF6I+d0oNYGWm/kcLiWw3+Xl4qnf
 JmRKMGDSydou9/I7nXt437o0JX4dmiF7jPGXc+pjZbnEFC2zEZTdc2kHWzkAn3V1gSAl
 Hu9FCTmyAtKxs8tWdI2G6Y/dh0Bvh+WzLoLzAyJ2QnYpWxC6zKV9cpe1sVsIEPWKNT7E
 iVYV5R/+pyflylvOahsY4t5XbCQibs6REFPZ0SdxGqNvL9GniE7dpOmgRXMxzo5dWcEd
 ZEmrJY5OG1t7TpFlJrOJdClXDU4QGKNZ3i/T4vOTVaMLxf8C2MQbB2F1vE0fQMBNsoGm
 GEng==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTo0MSBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxs
YW5veC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDQ6MzM6MDZQTSAt
MDQwMCwgSmVyb21lIEdsaXNzZSB3cm90ZToKPgo+ID4gU28gbm9yIEhNTSBub3IgZHJpdmVyIHNo
b3VsZCBkZXJlZmVyZW5jZSB0aGUgc3RydWN0IHBhZ2UgKGkgZG8gbm90Cj4gPiB0aGluayBhbnkg
aW9tbXUgZHJpdmVyIHdvdWxkIGVpdGhlciksCj4KPiBFciwgdGhleSBkbyB0ZWNobmljYWxseSBk
ZXJlZiB0aGUgc3RydWN0IHBhZ2U6Cj4KPiBub3V2ZWF1X2RtZW1fY29udmVydF9wZm4oc3RydWN0
IG5vdXZlYXVfZHJtICpkcm0sCj4gICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBobW1f
cmFuZ2UgKnJhbmdlKQo+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqcGFnZTsKPiAgICAg
ICAgICAgICAgICAgcGFnZSA9IGhtbV9wZm5fdG9fcGFnZShyYW5nZSwgcmFuZ2UtPnBmbnNbaV0p
Owo+ICAgICAgICAgICAgICAgICBpZiAoIW5vdXZlYXVfZG1lbV9wYWdlKGRybSwgcGFnZSkpIHsK
Pgo+Cj4gbm91dmVhdV9kbWVtX3BhZ2Uoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sIHN0cnVjdCBw
YWdlICpwYWdlKQo+IHsKPiAgICAgICAgIHJldHVybiBpc19kZXZpY2VfcHJpdmF0ZV9wYWdlKHBh
Z2UpICYmIGRybS0+ZG1lbSA9PSBwYWdlX3RvX2RtZW0ocGFnZSkKPgo+Cj4gV2hpY2ggZG9lcyB0
b3VjaCAncGFnZS0+cGdtYXAnCj4KPiBJcyB0aGlzIE9LIHdpdGhvdXQgaGF2aW5nIGEgZ2V0X2Rl
dl9wYWdlbWFwKCkgPwo+Cj4gTm90aW5nIHRoYXQgdGhlIGNvbGxpc2lvbi1yZXRyeSBzY2hlbWUg
ZG9lc24ndCBwcm90ZWN0IGFueXRoaW5nIGhlcmUKPiBhcyB3ZSBjYW4gaGF2ZSBhIGNvbmN1cnJl
bnQgaW52YWxpZGF0aW9uIHdoaWxlIGRvaW5nIHRoZSBhYm92ZSBkZXJlZi4KCkFzIGxvbmcgdGFr
ZV9kcml2ZXJfcGFnZV90YWJsZV9sb2NrKCkgaW4gSmVyb21lJ3MgZmxvdyBjYW4gcmVwbGFjZQpw
ZXJjcHVfcmVmX3RyeWdldF9saXZlKCkgb24gdGhlIHBhZ2VtYXAgcmVmZXJlbmNlLiBJdCBzZWVt
cwpub3V2ZWF1X2RtZW1fY29udmVydF9wZm4oKSBoYXBwZW5zIGFmdGVyOgoKICAgICAgICAgICAg
ICAgICAgICAgICAgbXV0ZXhfbG9jaygmc3ZtbS0+bXV0ZXgpOwogICAgICAgICAgICAgICAgICAg
ICAgICBpZiAoIW5vdXZlYXVfcmFuZ2VfZG9uZSgmcmFuZ2UpKSB7CgouLi5zbyBJIHdvdWxkIGV4
cGVjdCB0aGF0IHRvIGJlIGZ1bmN0aW9uYWxseSBlcXVpdmFsZW50IHRvIHZhbGlkYXRpbmcKdGhl
IHJlZmVyZW5jZSBjb3VudC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
