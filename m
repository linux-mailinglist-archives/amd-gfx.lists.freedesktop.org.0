Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA95206E6
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 14:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1122D89449;
	Thu, 16 May 2019 12:29:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7504789449
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 12:29:03 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id g57so4961242edc.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 05:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=i+Lyxzg1cYsoIY9/z0raLB7h90h+0ypKbiiOiLxJIc4=;
 b=BXtnW7le16y0T4Tbp95b+zn/rLLHpa5RvjZkF6xp3zPzG/oitp++Hocmw9uQkqpViw
 Tj8Moic0K3McHN2046tvLbDxRDzQGmeF+Bg6EHOh94HJE634MUlo28XD5Vesnj3ljCmW
 +KIdHKwBserkMU82Uz3zB+2a+A6r2PXUcLefscZ0z2pc6UtpIl+xF8siMRYeATPP9ZrE
 eQGLIeYVKvC7mbC9X5j1jobGiBczQJdF8g6QjV3VXXM0+F+xa8Ga8bYaDoLkbip09MyL
 Ux9A2ZHTB2AJ1cGcXHb3WI+qOaogBZa9gwlNkJhcWWyqkj2Xe9UxUNmrau1w/PTSKCFi
 X1Dw==
X-Gm-Message-State: APjAAAUKhstLIrQn9RbPyGFTs8edx6jNEZIJ5SkG2UHGR7+PCp9JDwHi
 Y/wGRW4hvE0AZ8y9bajFmgk9Xw==
X-Google-Smtp-Source: APXvYqxrreJ6ABa5awYWluY+zOs/iIa6BkyLYZkzZE6+e1vzjgscU8bF9TwZ1FvI0SbHUp2uC2Hnng==
X-Received: by 2002:a17:906:f19a:: with SMTP id
 gs26mr31357470ejb.78.1558009742079; 
 Thu, 16 May 2019 05:29:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id r2sm1055553ejp.76.2019.05.16.05.29.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 May 2019 05:29:00 -0700 (PDT)
Date: Thu, 16 May 2019 14:28:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [RFC PATCH v2 4/5] drm, cgroup: Add total GEM buffer allocation
 limit
Message-ID: <20190516122858.GB3851@phenom.ffwll.local>
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
 <20190509210410.5471-5-Kenny.Ho@amd.com>
 <d81e8f55-9602-818e-0f9c-1d9d150133b1@intel.com>
 <CAOWid-ftUrVVWPu9KuS8xpWKNQT6_FtxB8gEyEAn9nLD6qxb5Q@mail.gmail.com>
 <7db2caae-7eab-7c6a-fe90-89cb9cae30b4@amd.com>
 <6e124f5e-f83f-5ca1-4616-92538f202653@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e124f5e-f83f-5ca1-4616-92538f202653@gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=i+Lyxzg1cYsoIY9/z0raLB7h90h+0ypKbiiOiLxJIc4=;
 b=VHJchvJkBUL/IiXCqvxAcr+2npuP0fs7zrWHH7236TKDnakQ0iZlJdW4pCjn+8nxL+
 3E1lsKC0liOlLQT1gOGdcLFHiJvB76/L0bRTc6rSNm4I8IfC+OljCRbxjOQ257sm6jxr
 Y46sqchCpt5nqUfyFUQIu/9ra0M5fEiAkKh5U=
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
Cc: "sunnanyong@huawei.com" <sunnanyong@huawei.com>, "Ho,
 Kenny" <Kenny.Ho@amd.com>, "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Kenny Ho <y2kenny@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Tejun Heo <tj@kernel.org>, "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDk6MjU6MzFBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAxNi4wNS4xOSB1bSAwOToxNiBzY2hyaWViIEtvZW5pZywgQ2hyaXN0aWFu
Ogo+ID4gQW0gMTYuMDUuMTkgdW0gMDQ6Mjkgc2NocmllYiBLZW5ueSBIbzoKPiA+ID4gW0NBVVRJ
T046IEV4dGVybmFsIEVtYWlsXQo+ID4gPiAKPiA+ID4gT24gV2VkLCBNYXkgMTUsIDIwMTkgYXQg
NToyNiBQTSBXZWx0eSwgQnJpYW4gPGJyaWFuLndlbHR5QGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+
ID4gT24gNS85LzIwMTkgMjowNCBQTSwgS2VubnkgSG8gd3JvdGU6Cj4gPiA+ID4gPiBUaGVyZSBh
cmUgZm91ciBjb250cm9sIGZpbGUgdHlwZXMsCj4gPiA+ID4gPiBzdGF0cyAocm8pIC0gZGlzcGxh
eSBjdXJyZW50IG1lYXN1cmVkIHZhbHVlcyBmb3IgYSByZXNvdXJjZQo+ID4gPiA+ID4gbWF4IChy
dykgLSBsaW1pdHMgZm9yIGEgcmVzb3VyY2UKPiA+ID4gPiA+IGRlZmF1bHQgKHJvLCByb290IGNn
cm91cCBvbmx5KSAtIGRlZmF1bHQgdmFsdWVzIGZvciBhIHJlc291cmNlCj4gPiA+ID4gPiBoZWxw
IChybywgcm9vdCBjZ3JvdXAgb25seSkgLSBoZWxwIHN0cmluZyBmb3IgYSByZXNvdXJjZQo+ID4g
PiA+ID4gCj4gPiA+ID4gPiBFYWNoIGZpbGUgaXMgbXVsdGktbGluZWQgd2l0aCBvbmUgZW50cnkv
bGluZSBwZXIgZHJtIGRldmljZS4KPiA+ID4gPiBNdWx0aS1saW5lIGlzIGNvcnJlY3QgZm9yIG11
bHRpcGxlIGRldmljZXMsIGJ1dCBJIGJlbGlldmUgeW91IG5lZWQKPiA+ID4gPiB0byB1c2UgYSBL
RVkgdG8gZGVub3RlIGRldmljZSBmb3IgYm90aCB5b3VyIHNldCBhbmQgZ2V0IHJvdXRpbmVzLgo+
ID4gPiA+IEkgZGlkbid0IHNlZSB5b3VyIHNldCBmdW5jdGlvbnMgcmVhZGluZyBhIGtleSwgb3Ig
dGhlIGdldCBmdW5jdGlvbnMKPiA+ID4gPiBwcmludGluZyB0aGUga2V5IGluIG91dHB1dC4KPiA+
ID4gPiBjZ3JvdXBzLXYyIGNvbnZlbnRpb25zIG1lbnRpb24gdXNpbmcgS0VZIG9mIG1ham9yOm1p
bm9yLCBidXQgSSB0aGluawo+ID4gPiA+IHlvdSBjYW4gdXNlIGRybV9taW5vciBhcyBrZXk/Cj4g
PiA+IEdpdmVuIHRoaXMgY29udHJvbGxlciBpcyBzcGVjaWZpYyB0byB0aGUgZHJtIGtlcm5lbCBz
dWJzeXN0ZW0gd2hpY2gKPiA+ID4gdXNlcyBtaW5vciB0byBpZGVudGlmeSBkcm0gZGV2aWNlLAo+
ID4gV2FpdCBhIHNlY29uZCwgdXNpbmcgdGhlIERSTSBtaW5vciBpcyBhIGdvb2QgaWRlYSBpbiB0
aGUgZmlyc3QgcGxhY2UuCj4gCj4gV2VsbCB0aGF0IHNob3VsZCBoYXZlIHJlYWQgImlzIG5vdCBh
IGdvb2QgaWRlYSIuLgoKV2hhdCBlbHNlIHNob3VsZCB3ZSB1c2U/Cj4gCj4gQ2hyaXN0aWFuLgo+
IAo+ID4gCj4gPiBJIGhhdmUgYSB0ZXN0IHN5c3RlbSB3aXRoIGEgVmVnYTEwIGFuZCBhIFZlZ2Ey
MC4gV2hpY2ggZGV2aWNlIGdldHMgd2hpY2gKPiA+IG1pbm9yIGlzIG5vdCBzdGFibGUsIGJ1dCBy
YXRoZXIgZGVmaW5lZCBieSB0aGUgc2NhbiBvcmRlciBvZiB0aGUgUENJZSBidXMuCj4gPiAKPiA+
IE5vcm1hbGx5IHRoZSBzY2FuIG9yZGVyIGlzIGFsd2F5cyB0aGUgc2FtZSwgYnV0IGFkZGluZyBv
ciByZW1vdmluZwo+ID4gZGV2aWNlcyBvciBkZWxheWluZyB0aGluZ3MganVzdCBhIGxpdHRsZSBi
aXQgZHVyaW5nIGluaXQgaXMgZW5vdWdoIHRvCj4gPiBjaGFuZ2UgdGhpcy4KPiA+IAo+ID4gV2Ug
bmVlZCBzb21ldGhpbmcgbGlrZSB0aGUgTGludXggc3lzZnMgbG9jYXRpb24gb3Igc2ltaWxhciB0
byBoYXZlIGEKPiA+IHN0YWJsZSBpbXBsZW1lbnRhdGlvbi4KCllvdSBjYW4gZ28gZnJvbSBzeXNm
cyBsb2NhdGlvbiB0byBkcm0gY2xhc3MgZGlyZWN0b3J5IChpbiBzeXNmcykgYW5kIGJhY2suClRo
YXQgbWVhbnMgaWYgeW91IGNhcmUgeW91IG5lZWQgdG8gd2FsayBzeXNmcyB5b3Vyc2VsZiBhIGJp
dCwgYnV0IHVzaW5nCnRoZSBkcm0gbWlub3IgaXNuJ3QgYSBibG9ja2VyIGl0c2VsZi4KCk9uZSBk
b3duc2lkZSB3aXRoIHRoZSBkcm0gbWlub3IgaXMgdGhhdCBpdCdzIHByZXR0eSBnb29kIG5vbnNl
bnNlIG9uY2UgeW91CmhhdmUgbW9yZSB0aGFuIDY0IGdwdXMgdGhvdWdoLCBkdWUgdG8gaG93IHdl
IHNwYWNlIHJlbmRlciBhbmQgbGVnYWN5IG5vZGVzCmluIHRoZSBtaW5vciBpZHMgOi0pCi1EYW5p
ZWwKPiA+IAo+ID4gUmVnYXJkcywKPiA+IENocmlzdGlhbi4KPiA+IAo+ID4gPiAgICBJIGRvbid0
IHNlZSBhIG5lZWQgdG8gY29tcGxpY2F0ZQo+ID4gPiB0aGUgaW50ZXJmYWNlcyBtb3JlIGJ5IGhh
dmluZyBtYWpvciBhbmQgYSBrZXkuICBBcyB5b3UgY2FuIHNlZSBpbiB0aGUKPiA+ID4gZXhhbXBs
ZXMgYmVsb3csIHRoZSBkcm0gZGV2aWNlIG1pbm9yIGNvcnJlc3BvbmRzIHRvIHRoZSBsaW5lIG51
bWJlci4KPiA+ID4gSSBhbSBub3Qgc3VyZSBob3cgc3RyaWN0IGNncm91cCB1cHN0cmVhbSBpcyBh
Ym91dCB0aGUgY29udmVudGlvbiBidXQgSQo+ID4gPiBhbSBob3BpbmcgdGhlcmUgYXJlIGZsZXhp
YmlsaXR5IGhlcmUgdG8gYWxsb3cgZm9yIHdoYXQgSSBoYXZlCj4gPiA+IGltcGxlbWVudGVkLiAg
VGhlcmUgYXJlIGEgY291cGxlIG9mIG90aGVyIHRoaW5ncyBJIGhhdmUgZG9uZSB0aGF0IGlzCj4g
PiA+IG5vdCBkZXNjcmliZWQgaW4gdGhlIGNvbnZlbnRpb246IDEpIGluY2x1c2lvbiBvZiByZWFk
LW9ubHkgKi5oZWxwIGZpbGUKPiA+ID4gYXQgdGhlIHJvb3QgY2dyb3VwLCAyKSB1c2UgcmVhZC1v
bmx5ICh3aGljaCBJIGNhbiBwb3RlbnRpYWxseSBtYWtlIHJ3KQo+ID4gPiAqLmRlZmF1bHQgZmls
ZSBpbnN0ZWFkIG9mIGhhdmluZyBhIGRlZmF1bHQgZW50cmllcyAoc2luY2UgdGhlIGRlZmF1bHQK
PiA+ID4gY2FuIGJlIGRpZmZlcmVudCBmb3IgZGlmZmVyZW50IGRldmljZXMpIGluc2lkZSB0aGUg
Y29udHJvbCBmaWxlcyAodGhpcwo+ID4gPiB3YXksIHRoZSByZXNldHRpbmcgb2YgY2dyb3VwIHZh
bHVlcyBmb3IgYWxsIHRoZSBkcm0gZGV2aWNlcywgY2FuIGJlCj4gPiA+IGRvbmUgYnkgYSBzaW1w
bGUgJ2NwJy4pCj4gPiA+IAo+ID4gPiA+ID4gVXNhZ2UgZXhhbXBsZXM6Cj4gPiA+ID4gPiAvLyBz
ZXQgbGltaXQgZm9yIGNhcmQxIHRvIDFHQgo+ID4gPiA+ID4gc2VkIC1pICcycy8uKi8xMDczNzQx
ODI0LycgL3N5cy9mcy9jZ3JvdXAvPGNncm91cD4vZHJtLmJ1ZmZlci50b3RhbC5tYXgKPiA+ID4g
PiA+IAo+ID4gPiA+ID4gLy8gc2V0IGxpbWl0IGZvciBjYXJkMCB0byA1MTJNQgo+ID4gPiA+ID4g
c2VkIC1pICcxcy8uKi81MzY4NzA5MTIvJyAvc3lzL2ZzL2Nncm91cC88Y2dyb3VwPi9kcm0uYnVm
ZmVyLnRvdGFsLm1heAo+ID4gPiA+ID4gICAgLyoqIEBmaWxlIGRybV9nZW0uYwo+ID4gPiA+ID4g
QEAgLTE1NCw2ICsxNTYsOSBAQCB2b2lkIGRybV9nZW1fcHJpdmF0ZV9vYmplY3RfaW5pdChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4gPiA+ID4gICAgICAgICBvYmotPmhhbmRsZV9jb3VudCA9
IDA7Cj4gPiA+ID4gPiAgICAgICAgIG9iai0+c2l6ZSA9IHNpemU7Cj4gPiA+ID4gPiAgICAgICAg
IGRybV92bWFfbm9kZV9yZXNldCgmb2JqLT52bWFfbm9kZSk7Cj4gPiA+ID4gPiArCj4gPiA+ID4g
PiArICAgICBvYmotPmRybWNncnAgPSBnZXRfZHJtY2dycChjdXJyZW50KTsKPiA+ID4gPiA+ICsg
ICAgIGRybWNncnBfY2hnX2JvX2FsbG9jKG9iai0+ZHJtY2dycCwgZGV2LCBzaXplKTsKPiA+ID4g
PiBXaHkgZG8gdGhlIGNoYXJnaW5nIGhlcmU/Cj4gPiA+ID4gVGhlcmUgaXMgbm8gYmFja2luZyBz
dG9yZSB5ZXQgZm9yIHRoZSBidWZmZXIsIHNvIHRoaXMgaXMgcmVhbGx5IHRyYWNraW5nIHNvbWV0
aGluZyBha2luIHRvIGFsbG93ZWQgdmlydHVhbCBtZW1vcnkgZm9yIEdFTSBvYmplY3RzPwo+ID4g
PiA+IElzIHRoaXMgcmVhbGx5IHVzZWZ1bCBmb3IgYW4gYWRtaW5pc3RyYXRvciB0byBjb250cm9s
Pwo+ID4gPiA+IElzbid0IHRoZSByZXNvdXJjZSB3ZSB3YW50IHRvIGNvbnRyb2wgYWN0dWFsbHkg
dGhlIHBoeXNpY2FsIGJhY2tpbmcgc3RvcmU/Cj4gPiA+IFRoYXQncyBjb3JyZWN0LiAgVGhpcyBp
cyBqdXN0IHRoZSBmaXJzdCBsZXZlbCBvZiBjb250cm9sIHNpbmNlIHRoZQo+ID4gPiBiYWNraW5n
IHN0b3JlIGNhbiBiZSBiYWNrZWQgYnkgZGlmZmVyZW50IHR5cGUgb2YgbWVtb3J5LiAgSSBhbSBp
biB0aGUKPiA+ID4gcHJvY2VzcyBvZiBhZGRpbmcgYXQgbGVhc3QgdHdvIG1vcmUgcmVzb3VyY2Vz
LiAgU3RheSB0dW5lZC4gIEkgYW0KPiA+ID4gZG9pbmcgdGhlIGNoYXJnZSBoZXJlIHRvIGVuZm9y
Y2UgdGhlIGlkZWEgb2YgImNyZWF0b3IgaXMgZGVlbWVkIG93bmVyIgo+ID4gPiBhdCBhIHBsYWNl
IHdoZXJlIHRoZSBjb2RlIGlzIHNoYXJlZCBieSBhbGwgKHRoZSBpbml0IGZ1bmN0aW9uLikKPiA+
ID4gCj4gPiA+ID4gPiArICAgICB3aGlsZSAoaSA8PSBtYXhfbWlub3IgJiYgbGltaXRzICE9IE5V
TEwpIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgc3ZhbCA9ICBzdHJzZXAoJmxpbWl0cywgIlxu
Iik7Cj4gPiA+ID4gPiArICAgICAgICAgICAgIHJjID0ga3N0cnRvbGwoc3ZhbCwgMCwgJnZhbCk7
Cj4gPiA+ID4gSW5wdXQgc2hvdWxkIGJlICJLRVkgVkFMVUUiLCBzbyBLRVkgd2lsbCBkZXRlcm1p
bmUgZGV2aWNlIHRvIGFwcGx5IHRoaXMgdG8uCj4gPiA+ID4gQWxzbywgcGVyIGNncm91cHMtdjIg
ZG9jdW1lbnRhdGlvbiBvZiBsaW1pdHMsIEkgYmVsaWV2ZSBuZWVkIHRvIHBhcnNlIGFuZCBoYW5k
bGUgdGhlIHNwZWNpYWwgIm1heCIgaW5wdXQgdmFsdWUuCj4gPiA+ID4gCj4gPiA+ID4gcGFyc2Vf
cmVzb3VyY2VzKCkgaW4gcmRtYSBjb250cm9sbGVyIGlzIGV4YW1wbGUgZm9yIGJvdGggb2YgYWJv
dmUuCj4gPiA+IFBsZWFzZSBzZWUgbXkgcHJldmlvdXMgcmVwbHkgZm9yIHRoZSByYXRpb25hbGUg
b2YgbXkgaG9wZSB0byBub3QgbmVlZAo+ID4gPiBhIGtleS4gIEkgY2FuIGNlcnRhaW5seSBhZGQg
aGFuZGxpbmcgb2YgIm1heCIgYW5kICJkZWZhdWx0Ii4KPiA+ID4gCj4gPiA+IAo+ID4gPiA+ID4g
K3ZvaWQgZHJtY2dycF9jaGdfYm9fYWxsb2Moc3RydWN0IGRybWNncnAgKmRybWNncnAsIHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCj4gPiA+ID4gPiArICAgICAgICAgICAgIHNpemVfdCBzaXplKQo+
ID4gPiA+IFNob3VsZG4ndCB0aGlzIHJldHVybiBhbiBlcnJvciBhbmQgYmUgaW1wbGVtZW50ZWQg
d2l0aCBzYW1lIHNlbWFudGljcyBhcyB0aGUKPiA+ID4gPiB0cnlfY2hhcmdlKCkgZnVuY3Rpb25z
IG9mIG90aGVyIGNvbnRyb2xsZXJzPwo+ID4gPiA+IEJlbG93IHdpbGwgYWxsb3cgc3RhdHNfdG90
YWxfYWxsb2NhdGVkIHRvIG92ZXJydW4gbGltaXRzX3RvdGFsX2FsbG9jYXRlZC4KPiA+ID4gVGhp
cyBpcyBiZWNhdXNlIEkgYW0gY2hhcmdpbmcgdGhlIGJ1ZmZlciBhdCB0aGUgaW5pdCBvZiB0aGUg
YnVmZmVyCj4gPiA+IHdoaWNoIGRvZXMgbm90IGZhaWwgc28gdGhlICJ0cnkiIChkcm1jZ3JwX2Jv
X2Nhbl9hbGxvY2F0ZSkgaXMgc2VwYXJhdGUKPiA+ID4gYW5kIHBsYWNlZCBlYXJsaWVyIGFuZCBu
ZWFyZXIgb3RoZXIgY29uZGl0aW9uIHdoZXJlIGdlbSBvYmplY3QKPiA+ID4gYWxsb2NhdGlvbiBt
YXkgZmFpbC4gIEluIG90aGVyIHdvcmRzLCB0aGVyZSBhcmUgbXVsdGlwbGUgcG9zc2liaWxpdGll
cwo+ID4gPiBmb3Igd2hpY2ggZ2VtIGFsbG9jYXRpb24gbWF5IGZhaWwgKGNncm91cCBsaW1pdCBi
ZWluZyBvbmUgb2YgdGhlbSkgYW5kCj4gPiA+IHNhdGlzZnlpbmcgY2dyb3VwIGxpbWl0IGRvZXMg
bm90IG1lYW4gYSBjaGFyZ2UgaXMgbmVlZGVkLiAgSSBjYW4KPiA+ID4gY2VydGFpbmx5IGNvbWJp
bmUgdGhlIHR3byBmdW5jdGlvbnMgdG8gaGF2ZSBhbiBhZGRpdGlvbmFsIHRyeV9jaGFyZ2UKPiA+
ID4gc2VtYW50aWMgYXMgd2VsbCBpZiB0aGF0IGlzIHJlYWxseSBuZWVkZWQuCj4gPiA+IAo+ID4g
PiBSZWdhcmRzLAo+ID4gPiBLZW5ueQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gPiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
