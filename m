Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3959C8F8AB
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 03:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123CF6EAAC;
	Fri, 16 Aug 2019 01:56:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015A66EA6B
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 20:12:34 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id m24so7501371otp.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 13:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A0+yFoccKuBfbcsXsXsga1tmUthvWenlvN1lT3lVs28=;
 b=Zau+h+AlPQCMp7D3JRIEHb2CALGPIBYfizMg75Sp1VgSwTwTHAcAUwJaJF6xYnkoME
 pYS/N2f+6a5icKTxg3yj+Aa85mPGJQ3Uz3HqGXghgQRcYm5KxrQgN5fgch3PS2dM7/QN
 v0fD6po58KTMMsUzDMwaRjP8Sb8dtkVc3OnKf21AjEc2INNFmxV07tkot422xAJ+CYD9
 2voniZN8m8nySQ3l/dc8r1tM/3C3k9bYEXEQCb0amUprXc0JX2b/+VuHa1NPgd2kgyNk
 tI3QHK54i+t85N4RGPrhGdZrsft5LQ/MK4wa7oCfL7eBlPxv2Pm9R3VwXf2LLyVfTa2P
 COow==
X-Gm-Message-State: APjAAAWhsso3+jX7w+cGblzmEkpPtRkzTa+2sh1Wicp//j/Ae7Z0mLx2
 gpJlSiIGTMEnlWeD4LX9/NfJj2l7up8ND3Rnl/jjRA==
X-Google-Smtp-Source: APXvYqwuZcCCvgwgQl2Mb8pVIF/qyxKE2rFZqaszAzmMCreK6bW5n2dN0Ore2hO/padEjUkbv/NUNR4f+frL+RoGGBk=
X-Received: by 2002:a9d:7a9a:: with SMTP id l26mr4370413otn.71.1565899953979; 
 Thu, 15 Aug 2019 13:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190806160554.14046-5-hch@lst.de>
 <20190807174548.GJ1571@mellanox.com>
 <CAPcyv4hPCuHBLhSJgZZEh0CbuuJNPLFDA3f-79FX5uVOO0yubA@mail.gmail.com>
 <20190808065933.GA29382@lst.de>
 <CAPcyv4hMUzw8vyXFRPe2pdwef0npbMm9tx9wiZ9MWkHGhH1V6w@mail.gmail.com>
 <20190814073854.GA27249@lst.de> <20190814132746.GE13756@mellanox.com>
 <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
 <20190815180325.GA4920@redhat.com>
 <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
 <20190815194339.GC9253@redhat.com>
In-Reply-To: <20190815194339.GC9253@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 15 Aug 2019 13:12:22 -0700
Message-ID: <CAPcyv4jid8_=-8hBpn_Qm=c4S8BapL9B9RGT7e9uu303yH=Yqw@mail.gmail.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
To: Jerome Glisse <jglisse@redhat.com>
X-Mailman-Approved-At: Fri, 16 Aug 2019 01:56:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=A0+yFoccKuBfbcsXsXsga1tmUthvWenlvN1lT3lVs28=;
 b=qO7wFUVBcfsXZdEWtESTlkgDJFIn+h2Zftaw2r0fFx3myFLMcmx/1PxE8CN+fqldWQ
 zjBl3Dul7mG+AB3phn1DsCwl/3tGds0vBJ1kqEV+ap8hW1PegTxQmwVct4e6eZW5Mfez
 HLsQOrHW17zkzc1s7yiRXL2BVjwVwr/l/20Il9jmjG/teTTaa5j9sARFRpHce+kxtMJS
 6pcaFtAD6i7TvosBx8nv53Etr/AFABojJvFQyvd2/naDP/49htS0fK6O8E2SpX+XvJFi
 LHhffCbJNMAu8GkF3l05nJPd/24PikpQTsobVDta1UgZR+WEGVU1hpgkfCqVY0EkQboc
 34+w==
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTI6NDQgUE0gSmVyb21lIEdsaXNzZSA8amdsaXNzZUBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDEyOjM2OjU4UE0g
LTA3MDAsIERhbiBXaWxsaWFtcyB3cm90ZToKPiA+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDEx
OjA3IEFNIEplcm9tZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IE9uIFdlZCwgQXVnIDE0LCAyMDE5IGF0IDA3OjQ4OjI4QU0gLTA3MDAsIERhbiBXaWxsaWFt
cyB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCA2OjI4IEFNIEphc29uIEd1
bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24g
V2VkLCBBdWcgMTQsIDIwMTkgYXQgMDk6Mzg6NTRBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3aWcg
d3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFR1ZSwgQXVnIDEzLCAyMDE5IGF0IDA2OjM2OjMzUE0gLTA3
MDAsIERhbiBXaWxsaWFtcyB3cm90ZToKPiA+ID4gPiA+ID4gPiBTZWN0aW9uIGFsaWdubWVudCBj
b25zdHJhaW50cyBzb21ld2hhdCBzYXZlIHVzIGhlcmUuIFRoZSBvbmx5IGV4YW1wbGUKPiA+ID4g
PiA+ID4gPiBJIGNhbiB0aGluayBvZiBhIFBNRCBub3QgY29udGFpbmluZyBhIHVuaWZvcm0gcGdt
YXAgYXNzb2NpYXRpb24gZm9yCj4gPiA+ID4gPiA+ID4gZWFjaCBwdGUgaXMgdGhlIGNhc2Ugd2hl
biB0aGUgcGdtYXAgb3ZlcmxhcHMgbm9ybWFsIGRyYW0sIGkuZS4gc2hhcmVzCj4gPiA+ID4gPiA+
ID4gdGhlIHNhbWUgJ3N0cnVjdCBtZW1vcnlfc2VjdGlvbicgZm9yIGEgZ2l2ZW4gc3Bhbi4gT3Ro
ZXJ3aXNlLCBkaXN0aW5jdAo+ID4gPiA+ID4gPiA+IHBnbWFwcyBhcnJhbmdlIHRvIG1hbmFnZSB0
aGVpciBvd24gZXhjbHVzaXZlIHNlY3Rpb25zIChhbmQgbm93Cj4gPiA+ID4gPiA+ID4gc3Vic2Vj
dGlvbnMgYXMgb2YgdjUuMykuIE90aGVyd2lzZSB0aGUgaW1wbGVtZW50YXRpb24gY291bGQgbm90
Cj4gPiA+ID4gPiA+ID4gZ3VhcmFudGVlIGRpZmZlcmVudCBtYXBwaW5nIGxpZmV0aW1lcy4KPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFRoYXQgc2FpZCwgdGhpcyBzZWVtcyB0byB3YW50IGEg
YmV0dGVyIG1lY2hhbmlzbSB0byBkZXRlcm1pbmUgInBmbiBpcwo+ID4gPiA+ID4gPiA+IFpPTkVf
REVWSUNFIi4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU28gSSBndWVzcyB0aGlzIHBhdGNoIGlz
IGZpbmUgZm9yIG5vdywgYW5kIG9uY2UgeW91IHByb3ZpZGUgYSBiZXR0ZXIKPiA+ID4gPiA+ID4g
bWVjaGFuaXNtIHdlIGNhbiBzd2l0Y2ggb3ZlciB0byBpdD8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBX
aGF0IGFib3V0IHRoZSB2ZXJzaW9uIEkgc2VudCB0byBqdXN0IGdldCByaWQgb2YgYWxsIHRoZSBz
dHJhbmdlCj4gPiA+ID4gPiBwdXRfZGV2X3BhZ2VtYXBzIHdoaWxlIHNjYW5uaW5nPyBPZGRzIGFy
ZSBnb29kIHdlIHdpbGwgd29yayB3aXRoIG9ubHkKPiA+ID4gPiA+IGEgc2luZ2xlIHBhZ2VtYXAs
IHNvIGl0IG1ha2VzIHNvbWUgc2Vuc2UgdG8gY2FjaGUgaXQgb25jZSB3ZSBmaW5kIGl0Pwo+ID4g
PiA+Cj4gPiA+ID4gWWVzLCBpZiB0aGUgc2NhbiBpcyBvdmVyIGEgc2luZ2xlIHBtZCB0aGVuIGNh
Y2hpbmcgaXQgbWFrZXMgc2Vuc2UuCj4gPiA+Cj4gPiA+IFF1aXRlIGZyYW5rbHkgYW4gZWFzaWVy
IGFuIGJldHRlciBzb2x1dGlvbiBpcyB0byByZW1vdmUgdGhlIHBhZ2VtYXAKPiA+ID4gbG9va3Vw
IGFzIEhNTSB1c2VyIGFiaWRlIGJ5IG1tdSBub3RpZmllciBpdCBtZWFucyB3ZSB3aWxsIG5vdCBt
YWtlCj4gPiA+IHVzZSBvciBkZXJlZmVyZW5jZSB0aGUgc3RydWN0IHBhZ2Ugc28gdGhhdCB3ZSBh
cmUgc2FmZSBmcm9tIGFueQo+ID4gPiByYWNpbmcgaG90dW5wbHVnIG9mIGRheCBtZW1vcnkgKGFz
IGxvbmcgYXMgZGV2aWNlIGRyaXZlciB1c2luZyBobW0KPiA+ID4gZG8gbm90IGhhdmUgYSBidWcp
Lgo+ID4KPiA+IFllcywgYXMgbG9uZyBhcyB0aGUgZHJpdmVyIHJlbW92ZSBpcyBzeW5jaHJvbml6
ZWQgYWdhaW5zdCBITU0KPiA+IG9wZXJhdGlvbnMgdmlhIGFub3RoZXIgbWVjaGFuaXNtIHRoZW4g
dGhlcmUgaXMgbm8gbmVlZCB0byB0YWtlIHBhZ2VtYXAKPiA+IHJlZmVyZW5jZXMuIENhbiB5b3Ug
YnJpZWZseSBkZXNjcmliZSB3aGF0IHRoYXQgb3RoZXIgbWVjaGFuaXNtIGlzPwo+Cj4gU28gaWYg
eW91IGhvdHVucGx1ZyBzb21lIGRheCBtZW1vcnkgaSBhc3N1bWUgdGhhdCB0aGlzIGNhbiBvbmx5
Cj4gaGFwcGVucyBvbmNlIGFsbCB0aGUgcGFnZXMgYXJlIHVubWFwcGVkIChhcyBpdCBtdXN0IGhh
dmUgdGhlCj4gemVybyByZWZjb3VudCwgd2VsbCAxIGJlY2F1c2Ugb2YgdGhlIGJpYXMpIGFuZCBh
bnkgdW5tYXAgd2lsbAo+IHRyaWdnZXIgYSBtbXUgbm90aWZpZXIgY2FsbGJhY2suIFVzZXIgb2Yg
aG1tIG1pcnJvciBhYmlkaW5nIGJ5Cj4gdGhlIEFQSSB3aWxsIG5ldmVyIG1ha2UgdXNlIG9mIGlu
Zm9ybWF0aW9uIHRoZXkgZ2V0IHRocm91Z2ggdGhlCj4gZmF1bHQgb3Igc25hcHNob3QgZnVuY3Rp
b24gdW50aWwgY2hlY2tpbmcgZm9yIHJhY2luZyBub3RpZmllcgo+IHVuZGVyIGxvY2suCgpIbW0g
dGhhdCBmaXJzdCBhc3N1bXB0aW9uIGlzIG5vdCBndWFyYW50ZWVkIGJ5IHRoZSBkZXZfcGFnZW1h
cCBjb3JlLgpUaGUgZGV2X3BhZ2VtYXAgZW5kIG9mIGxpZmUgbW9kZWwgaXMgImRpc2FibGUsIGlu
dmFsaWRhdGUsIGRyYWluIiBzbwppdCdzIHBvc3NpYmxlIHRvIGNhbGwgZGV2bV9tdW5tYXBfcGFn
ZXMoKSB3aGlsZSBwYWdlcyBhcmUgc3RpbGwgbWFwcGVkCml0IGp1c3Qgd29uJ3QgY29tcGxldGUg
dGhlIHRlYXJkb3duIG9mIHRoZSBwYWdlbWFwIHVudGlsIHRoZSBsYXN0CnJlZmVyZW5jZSBpcyBk
cm9wcGVkLiBOZXcgcmVmZXJlbmNlcyBhcmUgYmxvY2tlZCBkdXJpbmcgdGhpcyB0ZWFyZG93bi4K
Ckhvd2V2ZXIsIGlmIHRoZSBkcml2ZXIgaXMgdmFsaWRhdGluZyB0aGUgbGl2ZW5lc3Mgb2YgdGhl
IG1hcHBpbmcgaW4KdGhlIG1tdS1ub3RpZmllciBwYXRoIGFuZCBibG9ja2luZyBuZXcgcmVmZXJl
bmNlcyBpdCBzb3VuZHMgbGlrZSBpdApzaG91bGQgYmUgb2suIE1pZ2h0IHRoZXJlIGJlIEdQVSBk
cml2ZXIgdW5pdCB0ZXN0cyB0aGF0IGNvdmVyIHRoaXMKcmFjaW5nIHRlYXJkb3duIGNhc2U/Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
