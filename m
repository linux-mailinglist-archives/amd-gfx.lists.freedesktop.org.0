Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F98F57BA1
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 07:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672536E432;
	Thu, 27 Jun 2019 05:43:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6A36E59B
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 05:43:25 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a14so5782549edv.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 22:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Qgn9IR2QmcvNfUYnBrywMUurBX3TO7Q1KJTZoJ8FHBE=;
 b=j6rUQRSoNzLvKwMpN6V47Mg3wiwFuYySaikMAcUnS/X+Xmz858XnORYaoGIz+FU0MZ
 Ft3E/X5edZ8tMpvJHdd35WwklOpOsT+ocGpEH5eVbNohSUdj5YimKgDdgIrXdyXrhLS5
 8m/0H/H+mg9YnK15nXOEae5uI4VhoP+knsVV/SxXBkUINEyqtMdK2StP3b5JudgXq37Y
 yRFzdXafkZ+gqBdsKidau240U0GyBEGc/tAJLDn/32nOliXNi+V2mVekWLr5KbKo76EE
 MGVqbzfkvDounrH8xYUCVqF/Q0/cn198zGIcfbLFuvHF83uBRlJgX/Pn3n+R2JnzyuDm
 9bfA==
X-Gm-Message-State: APjAAAVRbQxV5Te3vhefGnV4tvJkooUHxnKmcvLVwpeU01WOWrL5QuMz
 DGK4qg0wYjJK4dvfteNNBe7IOg==
X-Google-Smtp-Source: APXvYqwhBXQC4UnB5lxSBZaTatG4NCBAAWoA+G8bC5PVedBA9vd9Chet4N9Y1Tk8C/Oc5Kd01zqxdg==
X-Received: by 2002:a17:907:2130:: with SMTP id
 qo16mr1362102ejb.235.1561614203924; 
 Wed, 26 Jun 2019 22:43:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b21sm231154ejb.12.2019.06.26.22.43.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 22:43:23 -0700 (PDT)
Date: Thu, 27 Jun 2019 07:43:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [RFC PATCH v3 04/11] drm, cgroup: Add total GEM buffer
 allocation limit
Message-ID: <20190627054320.GB12905@phenom.ffwll.local>
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-5-Kenny.Ho@amd.com>
 <20190626160553.GR12905@phenom.ffwll.local>
 <CAOWid-eurCMx1F7ciUwx0e+p=s=NP8=UxQUhhF-hdK-iAna+fA@mail.gmail.com>
 <20190626214113.GA12905@phenom.ffwll.local>
 <CAOWid-egYGijS0a6uuG4mPUmOWaPwF-EKokR=LFNJ=5M+akVZw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-egYGijS0a6uuG4mPUmOWaPwF-EKokR=LFNJ=5M+akVZw@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Qgn9IR2QmcvNfUYnBrywMUurBX3TO7Q1KJTZoJ8FHBE=;
 b=JTrixo4hkZP+Q0hcfUZ8+DZ2B+hxtewjUhjhbXYgcrPxyRUMdKt0xaDtOdAXLk9A/O
 wvhov762axL+scQkWb9NwB9DuITKWeyKtYiDw7KNK3Gw+UD1S1kIvqmnN9IUAaZrxhkB
 0boqMSHpSZ4reIu2dphjBTi8fg0anpcyD4EH0=
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
Cc: joseph.greathouse@amd.com, Kenny Ho <Kenny.Ho@amd.com>, jsparks@cray.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, lkaplan@cray.com,
 Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDY6NDE6MzJQTSAtMDQwMCwgS2VubnkgSG8gd3JvdGU6
Cj4gT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgNTo0MSBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgo+ID4gT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDU6Mjc6NDhQTSAt
MDQwMCwgS2VubnkgSG8gd3JvdGU6Cj4gPiA+IE9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDEyOjA1
IFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPiA+ID4gU28gd2hh
dCBoYXBwZW5zIHdoZW4geW91IHN0YXJ0IGEgbG90IG9mIHRocmVhZHMgYWxsIGF0IHRoZSBzYW1l
IHRpbWUsCj4gPiA+ID4gYWxsb2NhdGluZyBnZW0gYm8/IEFsc28gd291bGQgYmUgbmljZSBpZiB3
ZSBjb3VsZCByb2xsIG91dCBhdCBsZWFzdCB0aGUKPiA+ID4gPiBhY2NvdW50aW5nIHBhcnQgb2Yg
dGhpcyBjZ3JvdXAgdG8gYWxsIEdFTSBkcml2ZXJzLgo+ID4gPgo+ID4gPiBXaGVuIHRoZXJlIGlz
IGEgbGFyZ2UgbnVtYmVyIG9mIGFsbG9jYXRpb24sIHRoZSBhbGxvY2F0aW9uIHdpbGwgYmUKPiA+
ID4gY2hlY2tlZCBpbiBzZXF1ZW5jZSB3aXRoaW4gYSBkZXZpY2UgKHNpbmNlIEkgdXNlZCBhIHBl
ciBkZXZpY2UgbXV0ZXgKPiA+ID4gaW4gdGhlIGNoZWNrLikgIEFyZSB5b3Ugc3VnZ2VzdGluZyB0
aGUgb3ZlcmhlYWQgaGVyZSBpcyBzaWduaWZpY2FudAo+ID4gPiBlbm91Z2ggdG8gYmUgYSBib3R0
bGVuZWNrPyAgVGhlIGFjY291bnRpbmcgcGFydCBzaG91bGQgYmUgYXZhaWxhYmxlIHRvCj4gPiA+
IGFsbCBHRU0gZHJpdmVycyAodW5sZXNzIEkgbWlzc2VkIHNvbWV0aGluZykgc2luY2UgdGhlIGNo
ZyBhbmQgdW5jaGcKPiA+ID4gZnVuY3Rpb24gaXMgY2FsbGVkIHZpYSB0aGUgZ2VuZXJpYyBkcm1f
Z2VtX3ByaXZhdGVfb2JqZWN0X2luaXQgYW5kCj4gPiA+IGRybV9nZW1fb2JqZWN0X3JlbGVhc2Uu
Cj4gPgo+ID4gdGhyZWFkIDE6IGNoZWNrcyBsaW1pdHMsIHN0aWxsIHVuZGVyIHRoZSB0b3RhbAo+
ID4KPiA+IHRocmVhZCAyOiBjaGVja3MgbGltaXRzLCBzdGlsbCB1bmRlciB0aGUgdG90YWwKPiA+
Cj4gPiB0aHJlYWQgMTogYWxsb2NhdGVzLCBzdGlsbCB1bmRlcgo+ID4KPiA+IHRocmVhZCAyOiBh
bGxvY2F0ZXMsIG5vdyBvdmVyIHRoZSBsaW1pdAo+ID4KPiA+IEkgdGhpbmsgdGhlIGNoZWNrIGFu
ZCBjaGcgbmVlZCB0byBiZSBvbmUgc3RlcCwgb3IgdGhpcyB3b250IHdvcmsuIE9yIEknbQo+ID4g
bWlzc2luZyBzb21ldGhpbmcgc29tZXdoZXJlLgo+IAo+IE9rLCBJIHNlZSB3aGF0IHlvdSBhcmUg
c2F5aW5nLgo+IAo+ID4gV3J0IHJvbGxpbmcgb3V0IHRoZSBhY2NvdW50aW5nIGZvciBhbGwgZHJp
dmVyczogU2luY2UgeW91IGFsc28gcm9sbCBvdXQKPiA+IGVuZm9yY2VtZW50IGluIHRoaXMgcGF0
Y2ggSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhlIGFjY291bnRpbmcgcGFydCBpcwo+ID4gZnVsbHkg
c3RhbmQtYWxvbmUuIEFuZCBhcyBkaXNjdXNzZWQgYSBiaXQgb24gYW4gZWFybGllciBwYXRjaCwg
SSB0aGluayBmb3IKPiA+IERSSVZFUl9HRU0gd2Ugc2hvdWxkIHNldCB1cCB0aGUgYWNjb3VudGlu
ZyBjZ3JvdXAgYXV0b21hdGljYWxseS4KPiBJIHRoaW5rIEkgc2hvdWxkIGJlIGFibGUgdG8gc3Bs
aXQgdGhlIGNvbW1pdCBhbmQgcmVzdHJ1Y3R1cmUgdGhpbmdzIGEgYml0Lgo+IAo+ID4gPiA+IFdo
YXQncyB0aGUgdW5kZXJseWluZyB0ZWNobmljYWwgcmVhc29uIGZvciBub3QgYWxsb3dpbmcgc2hh
cmluZyBhY3Jvc3MKPiA+ID4gPiBjZ3JvdXBzPwo+ID4gPiBUbyBiZSBjbGVhciwgc2hhcmluZyBh
Y3Jvc3MgY2dyb3VwIGlzIGFsbG93ZWQsIHRoZSBidWZmZXIganVzdCBuZWVkcwo+ID4gPiB0byBi
ZSBhbGxvY2F0ZWQgYnkgYSBwcm9jZXNzIHRoYXQgaXMgcGFyZW50IHRvIHRoZSBjZ3JvdXAuICBT
byBpbiB0aGUKPiA+ID4gY2FzZSBvZiB4b3JnIGFsbG9jYXRpbmcgYnVmZmVyIGZvciBjbGllbnQs
IHRoZSB4b3JnIHdvdWxkIGJlIGluIHRoZQo+ID4gPiByb290IGNncm91cCBhbmQgdGhlIGJ1ZmZl
ciBjYW4gYmUgcGFzc2VkIGFyb3VuZCBieSBkaWZmZXJlbnQgY2xpZW50cwo+ID4gPiAoaW4gcm9v
dCBvciBvdGhlciBjZ3JvdXAuKSAgVGhlIGlkZWEgaGVyZSBpcyB0byBlc3RhYmxpc2ggc29tZSBm
b3JtIG9mCj4gPiA+IG93bmVyc2hpcCwgb3RoZXJ3aXNlIHRoZXJlIHdvdWxkbid0IGJlIGEgd2F5
IHRvIGFjY291bnQgZm9yIG9yIGxpbWl0Cj4gPiA+IHRoZSB1c2FnZS4KPiA+Cj4gPiBCdXQgd2h5
PyBXaGF0J3MgdGhlIHByb2JsZW0gaWYgSSBhbGxvY2F0ZSBzb21ldGhpbmcgYW5kIHRoZW4gaGFu
ZCBpdCB0bwo+ID4gc29tZW9uZSBlbHNlLiBFLmcuIG9uZSBwb3B1bGFyIHVzZSBvZiBjZ3JvdXBz
IGlzIHRvIGlzb2xhdGUgY2xpZW50cywgc28KPiA+IG1heWJlIHlvdSdkIGRvIGEgY2dyb3VwICsg
bmFtZXNwYWNlIGZvciBlYWNoIFgxMSBjbGllbnQgKG9rIHdheWxhbmQsIHdpdGgKPiA+IFgxMSB0
aGlzIGlzIHByb2JhYmx5IHBvaW50bGVzcykuCj4gPgo+ID4gQnV0IHdpdGggeW91ciBjdXJyZW50
IGxpbWl0YXRpb24gdGhvc2UgY2xpZW50cyBjYW4ndCBwYXNzIGJ1ZmZlcnMgdG8gdGhlCj4gPiBj
b21wb3NpdG9yIGFueW1vcmUsIG1ha2luZyBjZ3JvdXBzIHVzZWxlc3MuIFlvdXIgZXhhbXBsZSBo
ZXJlIG9ubHkgd29ya3MKPiA+IGlmIFhvcmcgaXMgaW4gdGhlIHJvb3QgYW5kIGFsbG9jYXRlcyBh
bGwgdGhlIGJ1ZmZlcnMuIFRoYXQncyBub3QgZXZlbiB0cnVlCj4gPiBmb3IgRFJJMyBhbnltb3Jl
Lgo+ID4KPiA+IFNvIHByZXR0eSBzZXJpb3VzIGxpbWl0YXRpb24gb24gY2dyb3VwcywgYW5kIEkn
bSBub3QgcmVhbGx5IHVuZGVyc3RhbmRpbmcKPiA+IHdoeSB3ZSBuZWVkIHRoaXMuIEkgdGhpbmsg
aWYgd2Ugd2FudCB0byBwcmV2ZW50IGJ1ZmZlciBzaGFyaW5nLCB3aGF0IHdlCj4gPiBuZWVkIGFy
ZSBzb21lIHNlbGludXggaG9va3MgYW5kIHN0dWZmIHNvIHlvdSBjYW4gcHJldmVudCBhbiBpbXBv
cnQvYWNjZXNzCj4gPiBieSBzb21lb25lIHdobydzIG5vdCBhbGxvd2VkIHRvIHRvdWNoIGEgYnVm
ZmVyLiBCdXQgdGhhdCBraW5kIG9mIGFjY2Vzcwo+ID4gcmlnaHQgbWFuYWdlbWVudCBzaG91bGQg
YmUgc2VwYXJhdGUgZnJvbSByZXNvdXJjZSBjb250cm9sIGltby4KPiBTbyB3aXRob3V0IHRoZSBz
aGFyaW5nIHJlc3RyaWN0aW9uIGFuZCBzb21lIGtpbmQgb2Ygb3duZXJzaGlwCj4gc3RydWN0dXJl
LCB3ZSB3aWxsIGhhdmUgdG8gbWlncmF0ZS9jaGFuZ2UgdGhlIG93bmVyIG9mIHRoZSBidWZmZXIg
d2hlbgo+IHRoZSBjZ3JvdXAgdGhhdCBjcmVhdGVkIHRoZSBidWZmZXIgZGllIGJlZm9yZSB0aGUg
cmVjZWl2aW5nIGNncm91cChzKQo+IGFuZCBJIGFtIG5vdCBzdXJlIGhvdyB0byBkbyB0aGF0IHBy
b3Blcmx5IGF0IHRoZSBtb21lbnQuICAxKSBTaG91bGQKPiBlYWNoIGNncm91cCBrZWVwIHRyYWNr
IG9mIGFsbCB0aGUgYnVmZmVycyB0aGF0IGJlbG9uZ3MgdG8gaXQgYW5kCj4gbWlncmF0ZT8gIChJ
cyB0aGF0IGVmZmljaWVudD8pICAyKSB3aGljaCBjZ3JvdXAgc2hvdWxkIGJlIHRoZSBuZXcKPiBv
d25lciAoYW5kIHRoZXJlZm9yZSBoYXZlIHRoZSBsaW1pdCBhcHBsaWVkPykgIEhhdmluZyB0aGUg
Y3JlYXRvcgo+IGJlaW5nIHRoZSBvd25lciBpcyBraW5kIG9mIG5hdHVyYWwsIGJ1dCBsZXQgc2F5
IHRoZSBidWZmZXIgaXMgc2hhcmVkCj4gd2l0aCA1IG90aGVyIGNncm91cHMsIHdoaWNoIG9mIHRo
ZXNlIDUgY2dyb3VwcyBzaG91bGQgYmUgdGhlIG5ldyBvd25lcgo+IG9mIHRoZSBidWZmZXI/CgpE
aWZmZXJlbnQgYW5zd2VyczoKCi0gRG8gd2UgY2FyZSBpZiB3ZSBsZWFrIGJvcyBsaWtlIHRoaXMg
aW4gYSBjZ3JvdXAsIGlmIHRoZSBjZ3JvdXAKICBkaXNhcHBlYXJzIGJlZm9yZSBhbGwgdGhlIGJv
IGFyZSBjbGVhbmVkIHVwPwoKLSBKdXN0IGNoYXJnZSB0aGUgYm8gdG8gZWFjaCBjZ3JvdXAgaXQn
cyBpbj8gV2lsbCBiZSBxdWl0ZSBhIGJpdCBtb3JlCiAgdHJhY2tpbmcgbmVlZGVkIHRvIGdldCB0
aGF0IGRvbmUgLi4uCgotIEFsc28sIHRoZXJlJ3MgdGhlIGxlZ2FjeSB3YXkgb2Ygc2hhcmluZyBh
IGJvLCB3aXRoIHRoZSBGTElOSyBhbmQKICBHRU1fT1BFTiBpb2N0bHMuIFdlIG5lZWQgdG8gcGx1
ZyB0aGVzZSBob2xlcyB0b28uCgpKdXN0IGZlZWxzIGxpa2UgeW91ciBjdXJyZW50IHNvbHV0aW9u
IGlzIHRlY2huaWNhbGx5IHdlbGwtanVzdGlmaWVkLCBidXQKaXQgY29tcGxldGVseSBkZWZlYXRz
IHRoZSBwb2ludCBvZiBjZ3JvdXBzL2NvbnRhaW5lcnMgYW5kIGJ1ZmZlciBzaGFyaW5nCi4uLgoK
Q2hlZXJzLCBEYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
