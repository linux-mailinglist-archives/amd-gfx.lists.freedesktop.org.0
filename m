Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20763114FAD
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Dec 2019 12:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54A46E89D;
	Fri,  6 Dec 2019 11:17:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03E26E89D
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Dec 2019 11:17:08 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id c93so5469667edf.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 06 Dec 2019 03:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=IWNDKEm3mQtYidud/IsdkVDMkHuEWWm3OBWcf1cj7PU=;
 b=ufxnEaP7EQOO11B8hiWNKeWshRY5SvugCIJhbl7avgwyPwB/qVSnjyOMpzfZ5q8nG6
 qbDn7MeBH49ENpk3Q6Q4qJViX2IXFG7iPTp/cACuqf+SM2+i+vf9Pa+XCK4HnqSUkm33
 SDOhKq9J0pt1a7SFFMMpx+z8LM6oXyvSG6LBebIQgBQKgxO1Gudw/0zvNVXoSMGhukrE
 61Ar3C/o9ptNYsDaNWEyFz/X5XRXqmDIrNXPtORC0Xmfmr+YsGVolxrJMlWr1TpRa7ot
 6T/BO3xkPQyblwdGGPbGR/33RN1V3ZyGB5SYEcR+q5csHIgkd/XeFI3wAHAuLezMSnSm
 gPNw==
X-Gm-Message-State: APjAAAWKtQdVUdbE2rhx6bBZ+A7x8e8uhPamxp4e56YTvYh9KdsVmO3B
 aQAXbBgCtpnnNpxrfzqKUdRp3xvnYJmv1vL62PreMLQ=
X-Google-Smtp-Source: APXvYqzPb1KoqNBgEyv+5VYfRPIxgksZVXvliOZa6EHGehPPAhdeXxv2rch592cwdqe47X2t7wByarG8cj4w7VrLYPA=
X-Received: by 2002:a17:906:6043:: with SMTP id
 p3mr14836469ejj.103.1575631026834; 
 Fri, 06 Dec 2019 03:17:06 -0800 (PST)
MIME-Version: 1.0
References: <CAKbQEqEE3dgcF1bi-Sh5FQoHiU2TEHYn-H5fE92g6Pa+rgXbiQ@mail.gmail.com>
 <DM6PR12MB3466514DDFE311ACBECE0B259E5F0@DM6PR12MB3466.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB3466514DDFE311ACBECE0B259E5F0@DM6PR12MB3466.namprd12.prod.outlook.com>
From: Christian Pernegger <pernegger@gmail.com>
Date: Fri, 6 Dec 2019 12:16:30 +0100
Message-ID: <CAKbQEqF9u7B0G_kc3seD-a8q2fh_LVK5nO-u17MqnOViaqq86g@mail.gmail.com>
Subject: Re: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for
 fences timed out or interrupted!
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=IWNDKEm3mQtYidud/IsdkVDMkHuEWWm3OBWcf1cj7PU=;
 b=WoOaVzu4UZoSr2inRNyAoUHMe2a/naTKDG0Hq3VjHhNEX9irdPaymxni4HaR+Qy0yu
 SCmPfusK+OQdflIq4wmPd6k3RqRo2ol8p6J1Jml+ActoWLZDOyNeImiUrv1awBaQd4Nh
 9T/RP2vL/ZKWDZueNLkUV+EMQWB7EJW/l2JQOc11CARCTxXC9fuIkfpM2NBAzrB7TI/7
 gqVMJ9hcv7sUl8gT5HGJdc1Dfv/KuhOWxSdsEehpG3vXC06MDXSm/nLpCehkfEeRPNXM
 ZErp5PvWnR2tNhFEbS0fE21eyZTyQ7EYmnMK1YQG/OgGoK1+2p6Fl/bkUKvmuNq9IetP
 beXg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gRnIuLCA2LiBEZXouIDIwMTkgdW0gMDI6NDMgVWhyIHNjaHJpZWIgTGl1LCBaaGFuIDxaaGFu
LkxpdUBhbWQuY29tPjoKPiBJJ3ZlIHNlZW4gYSBmZXcgcGVvcGxlIHJlcG9ydGVkIHRoaXMgaXNz
dWUgb24gRnJlZWRlc2t0b3AvQnVnemlsbGEuIEZvciBleGFtcGxlOgo+IGh0dHBzOi8vYnVncy5m
cmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMTEyNC4KClllcywgdGhlcmUncyBhbHNv
IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwOTk1NS4KVG8g
YmUgaG9uZXN0LCBJIGNvdWxkbid0IHNheSBpZiBteSBpc3N1ZSBpcyB0aGUgc2FtZSBhcyBlaXRo
ZXIgb2YKdGhlc2UgLS0gSSB3b3VsZG4ndCBrbm93IHdoZXJlIHRvIGJlZ2luIHRvIGludGVycHJl
dCB0aGVzZSBsb2dzLCBvcgpldmVuIHNheSB3aGV0aGVyIHRoZXkncmUgZXNzZW50aWFsbHkgc2hv
d2luZyB0aGUgc2FtZSBvciBzb21ldGhpbmcKY29tcGxldGVseSBkaWZmZXJlbnQuIEZyb20gZXhw
ZXJpZW5jZSwgYmxpbmRseSBsb2JiaW5nIHN0dWZmIHRvZ2V0aGVyCmJlY2F1c2Ugb2YgdGhlIGZp
cnN0IGVycm9yIG1lc3NhZ2UgdGhhdCBwb3BzIG91dCBpcyBkYW5nZXJvdXMuIFRoYXQncwp3aHkg
SSdtIGFza2luZyBoZXJlLgoKPiBUaGV5IGFsbCBleHBlcmllbmNlZCB0aGlzIGlzc3VlIHdoaWxl
IHBsYXlpbmcgZ2FtZXMuIFRoZSBoaWdoZXIgR1BVIGNsb2NrIGlzLCB0aGUgbW9yZSBmcmVxdWVu
dCBpc3N1ZSBjYW4gYmUgcmVwcm9kdWNlZC4KClNob3VsZG4ndCB0aGF0IG1lYW4gdGhhdCBtb3Jl
IGRlbWFuZGluZyBnYW1lcyBjcmFzaCBtb3JlIG9mdGVuPwpOZWl0aGVyIE9yaSBub3IgQ0syIGFy
ZSBsaWtlbHkgdG8gdGF4IGEgUmFkb24gVklJLCBhdCBsZWFzdCB0ZW1wcyBzdGF5CmRvd24sIGFu
ZCBzbyBkbyB0aGUgZmFucy4gSSByZW1lbWJlciBhIHNpbmdsZSBjcmFzaCBmcm9tIE92ZXJjb29r
ZWQKW1Byb3Rvbi9EWFZLXSwgc2FtZTsgYnV0IG5vbmUgZnJvbSBQcmV5ICgyMDE3KSBbUHJvdG9u
L0RYVktdIG9yIExpZmUKaXMgU3RyYW5nZSAtIEJlZm9yZSB0aGUgU3Rvcm0gW25hdGl2ZSBWdWxr
YW5dLiBUaGF0IHNhaWQsIEkgbW9zdGx5CnBsYXkgZ2FtZXMgb25lIGFmdGVyIHRoZSBvdGhlciwg
anVzdCBiZWNhdXNlIHNvbWV0aGluZyBkaWRuJ3QgY3Jhc2gKdGhlbiwgdGhhdCBkb2Vzbid0IG1l
YW4gaXQgd291bGRuJ3Qgbm93LgoKPiBBbHNvLCBzb21lIFJlZGRpdCB1c2VycyBwb2ludGVkIG91
dCBhbGwgdGhlc2UgZ2FtZXMgYXJlIFZ1bGthbiBiYXNlZC4gSXQgY291bGQgYmUgYSBWdWxrYW4g
c3BlY2lmaWMgaXNzdWUuCgpJJ20gcnVubmluZyBPcmkgdXNpbmcgV0lORUQzRCAoRDNELU9wZW5H
TCksIENLMiBpcyBuYXRpdmUgT3BlbkdMCkFGQUlLLCB0aGF0IGh5cG90aGVzaXMgZG9lc24ndCBo
b2xkLgoKVGhlIHZhcmlvdXMgc2VhcmNoIHJlc3VsdHMgdGhhdCBsb29rIHNpbWlsYXIgdG8gdGhl
IGxheW1hbiBhbHNvIG9mZmVyCmEgcGxldGhvcmEgb2Ygd29ya2Fyb3VuZHMsIGEgbG90IG9mIHdo
aWNoIGxvb2sgdG8gYmUgb2YgdGhlIHNhY3JpZmljZQphIGNoaWNrZW4gYXQgZnVsbCBtb29uIGFu
ZCBkYW5jZSBhcm91bmQgaXQgY291bnRlci1jbG9ja3dpc2UgaW50b25pbmcKc2VhIHNoYW50aWVz
IGF0IHRoZSB0b3Agb2YgeW91ciB2b2ljZSB2YXJpZXR5IHRvIHRoYXQgc2FtZSBsYXltYW4uClVu
ZGVyc3RhbmRhYmxlLCB3aGVuIHlvdSBkb24ndCBrbm93IGlmIGl0IGhlbHBlZCBvciB0aGUgYnVn
IGp1c3QgdGFrZXMKcGFydGljdWxhcmx5IGxvbmcgdG8gdHJpZ2dlci4gSSdkIHN0aWxsIHJhdGhl
ciBoZWxwIGlkZW50aWZ5ICYgZml4IHRoZQpyb290IGNhdXNlLgoKVGhhbmsgeW91IGZvciBjYXJp
bmcuCgpDaGVlcnMsCkMuCgoKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9t
OiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhh
bGYgT2YKPiA+IENocmlzdGlhbiBQZXJuZWdnZXIKPiA+IFNlbnQ6IDIwMTkvRGVjZW1iZXIvMDUs
IFRodXJzZGF5IDY6MTUgUE0KPiA+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
ID4gU3ViamVjdDogW2RybTphbWRncHVfZG1fYXRvbWljX2NvbW1pdF90YWlsIFthbWRncHVdXSAq
RVJST1IqCj4gPiBXYWl0aW5nIGZvciBmZW5jZXMgdGltZWQgb3V0IG9yIGludGVycnVwdGVkIQo+
ID4KPiA+IEhlbGxvLAo+ID4KPiA+IG9uZSBvZiBteSBjb21wdXRlcnMgaGFzIGJlZW4gY3Jhc2hp
bmcgd2hpbGUgZ2FtaW5nIHJhdGhlciBhIGxvdCBsYXRlbHksIHdpdGgKPiA+IGtlcm5lbCBtZXNz
YWdlcyBwb2ludGluZyB0byBhbWRncHUuIEZpcnN0IGxpbmUgc2VlIHN1YmplY3QsIHJlc3QgaW4g
dGhlCj4gPiBhdHRhY2hlZCBsb2cuCj4gPiBTU0ggc3RpbGwgd29ya3MsIGF0dGVtcHRzIHRvIHNo
dXRkb3duL3JlYm9vdCBkb24ndCBxdWl0ZSBmaW5pc2guCj4gPgo+ID4gUmFkZW9uIFZJSSBpbiBh
biBBc3VzIFBybyBXUyBYNTcwLUFjZS4gVWJ1bnR1IDE4LjA0LjMgSFdFLCBtZXNhLWFjby4KPiA+
IFRoaXMgb25lIHdhcyB3aXRoIGtlcm5lbCA1LjMuMC0yNC1nZW5lcmljIFtod2UtZWRnZV0sIG1l
c2EKPiA+IDE5LjMuMCthY28rZ2l0MTU3NTQ1MjgzMy0zNDA5YzA2ZTI2ZC0xYmlvbmljMSwgdmVz
YTIwXyogZnJvbSBsaW51eC0KPiA+IGZpcm13YXJlLTIwMTkxMDIyLCBydW5uaW5nIE9yaSBhbmQg
dGhlIEJsaW5kIEZvcmVzdDogRGVmaW5pdGl2ZSBFZGl0aW9uIHZpYQo+ID4gUHJvdG9uL1dJTkVE
M0QxMSB1bmRlciBTdGVhbSBSZW1vdGUgUGxheS4gSSd2ZSBoYWQgc2ltaWxhciBjcmFzaGVzCj4g
PiBzcG9yYWRpY2FsbHkgZXZlbiB3aXRoIDUuMCBbcGxhaW4gaHdlXSBhbmQgbGludXgtZmlybXdh
cmUgY29tcGxldGVseSBzdG9jaywKPiA+IGFuZCB3aXRoIG5hdGl2ZSBnYW1lcyAoZS5nLiBDcnVz
YWRlciBLaW5ncyBJSSkgcnVubmluZyBsb2NhbGx5Lgo+ID4gSXQgdXNlZCB0byBiZSBtYXliZSBv
bmNlIGV2ZXJ5IG90aGVyIHdlZWssIHRob3VnaCwgdGhhdCB3YXMgdG9sZXJhYmxlLCBub3cKPiA+
IE9yaSB1c3VhbGx5IHRyaWdnZXJzIGl0IGluIHVuZGVyIGFuIGhvdXIuIFR1cm5pbmcgb2ZmIEFD
TyB2aWEKPiA+IFJBRFZfUEVSRlRFU1Q9bGx2bSBtYWtlcyBpdCB3b3JzZSAobm90IGJhZCBlbm91
Z2ggdG8gbWFrZSBpdCB0cmlnZ2VyCj4gPiBxdWlja2x5IGFuZCByZWxpYWJseS4gdGhvdWdoKSwg
Z29pbmcgYmFjayB0byBrZXJuZWwgNS4wIGhlbHBzIChhcyBpbiBhbiBob3VyIG9yCj4gPiB0d28g
bWlnaHQgZ28gYnkgd2l0aG91dCBhIGNyYXNoLCBidXQgdGhlIHBlcmZvcm1hbmNlIGltcGFjdCBp
cyBzZXZlcmUpLgo+ID4KPiA+IEFsbCB2ZXJ5IHZhZ3VlLiBXaGljaCBpcyB3aHkgdGhpcyBpc24n
dCBwcmV0ZW5kaW5nIHRvIGJlIGEgYnVnIHJlcG9ydCwganVzdCBhCj4gPiAiaGFzIGFueW9uZSBz
ZWVuIHRoaXM/IiBraW5kIG9mIHNob3V0LW91dC4gSWYgaXQncyB3b3J0aHkgb2YgZm9sbG93aW5n
IHVwLCBJJ2QKPiA+IGJlIGhhcHB5IHRvIHByb3ZpZGUgZnVydGhlciBpbmZvLCBqdXN0IHRlbGwg
bWUgd2hhdC4KPiA+Cj4gPiBDaGVlcnMsCj4gPiBDLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
