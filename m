Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 452CB21C1D
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 18:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2796F8991A;
	Fri, 17 May 2019 16:59:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273D089916
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 16:59:43 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m3so7715124wrv.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 09:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I5mR3yLGNgVLNQzk4S9gFdpnYlGQ99rLXjzXr21fvoQ=;
 b=nn1Ec4qY7B9A+vAQmPp6ez1av1n5bQQL5saY9lNmRM4svng84y88MRQ1cRouKDTgIV
 3nsPTVlsPxJndNHuboNTRX5zZxuJIwY/LCCFJLDYAyVRg7dKNWL3PX2ydoleFQuNBpTk
 yviBFKVQOnD3aJMCdmtoNfFjQ9kIptBcadPtk2mgXfW6Ux/JHo6cKjtoBRBNF1O3Ps3T
 V1A0EeuCpov35a+slfotoQmmoGl7w13qRMw9OFiG54wcrTuRcd9cm0zg0/8WFwmRHwyg
 hCHt8uuL4C0BiwEALcEgw+ueRK4DN6P1Wm7ttiRGDCWYWg/KTYXBQt3ePUCxggvUUJPw
 dDkA==
X-Gm-Message-State: APjAAAUtxnNyfhO340G89wI78escJPgHIPIGcVQNhiiuZE18wFB52B1r
 A42uKxJDKK9vbmEVd1pXaLwQ59HCS4D003Aylds=
X-Google-Smtp-Source: APXvYqxVW20rM7lsQD0Tcwo4odt8sAt827qq6u9U8BPTFUlQJmxJMySg03mZ/u3yMfibv5EpC0Yg+S+i+WvmKoiRTYQ=
X-Received: by 2002:a5d:430f:: with SMTP id h15mr17806763wrq.132.1558112381728; 
 Fri, 17 May 2019 09:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ-EccO1ue5hTtJ8m4utQp+8dSsWm60JFA5YOT1gCODnYcFUog@mail.gmail.com>
 <CADnq5_N=-cWz99T4ma_=6-_bu-Ty2twsFt=KGtzTdWn1hcDSrA@mail.gmail.com>
 <CAJ-EccOH2dXPD+XeHQcqZYD+xa2eB6SVp6oFk4AD0vy=H+9+0w@mail.gmail.com>
 <CADnq5_OTk4nE4G6FHmSRmvNLNO4hJbVC9cuxAiGEZk1_b2C=9w@mail.gmail.com>
 <CAJ-EccPFdxNTe5ESwJDg0MKSZasigkcg9CjxN__MgXaF2RURQw@mail.gmail.com>
In-Reply-To: <CAJ-EccPFdxNTe5ESwJDg0MKSZasigkcg9CjxN__MgXaF2RURQw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 May 2019 12:59:29 -0400
Message-ID: <CADnq5_Osm1NaWWrDNpNNV1c+nyw3NfPyEi=_RjuUNh7hkAfzvQ@mail.gmail.com>
Subject: Re: GPU passthrough support for Stoney [Radeon R2/R3/R4/R5 Graphics]?
To: Micah Morton <mortonm@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=I5mR3yLGNgVLNQzk4S9gFdpnYlGQ99rLXjzXr21fvoQ=;
 b=hcyD369ALkjfR9B0DAvcUFyVL42XI7Cehtkh47WtL5APkbo/ZKRNhb5DTJSW0BzU0i
 H9bUzZEJqikWokAkA3X2LekXKh8rnDp8RWg7mA96D+AYB6Ry7EXexx46y11hZdDW2ZOY
 weZ1BMrP1BUbAO/XkAZNoFtzetTRuI5mQTVCnGGZSx7YB3XIyltazJzSbXmBPLn1GwWu
 e2x2czDpKeUXZvAqoudI+tauXiPoy2RpyMETNTRV9clHf+M8ESzGVKimVC99v24YiiRK
 vAfXGjRTp6ImMvL2XXRoe4s9VdwEYechzW/zWd1PF0qSkPLCtFfn/y/uPpnmgvkqrZOA
 EwQA==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMTE6MzYgQU0gTWljYWggTW9ydG9uIDxtb3J0b25tQGNo
cm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAxOjM5IFBNIEFs
ZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUs
IE1heSAxNiwgMjAxOSBhdCA0OjA3IFBNIE1pY2FoIE1vcnRvbiA8bW9ydG9ubUBjaHJvbWl1bS5v
cmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCA3OjE5IFBNIEFs
ZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+
IE9uIFdlZCwgTWF5IDE1LCAyMDE5IGF0IDI6MjYgUE0gTWljYWggTW9ydG9uIDxtb3J0b25tQGNo
cm9taXVtLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSGkgZm9sa3MsCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gSSdtIGludGVyZXN0ZWQgaW4gcnVubmluZyBhIFZNIG9uIGEgc3lzdGVtIHdp
dGggYW4gaW50ZWdyYXRlZCBTdG9uZXkKPiA+ID4gPiA+IFtSYWRlb24gUjIvUjMvUjQvUjUgR3Jh
cGhpY3NdIGNhcmQgYW5kIHBhc3NpbmcgdGhyb3VnaCB0aGUgZ3JhcGhpY3MKPiA+ID4gPiA+IGNh
cmQgdG8gdGhlIFZNIHVzaW5nIHRoZSBJT01NVS4gSSdtIHdvbmRlcmluZyB3aGV0aGVyIHRoaXMg
aXMgZmVhc2libGUKPiA+ID4gPiA+IGFuZCBzdXBwb3NlZCB0byBiZSBkb2FibGUgd2l0aCB0aGUg
cmlnaHQgc2V0dXAgKGFzIG9wcG9zZWQgdG8gcGFzc2luZwo+ID4gPiA+ID4gYSBkaXNjcmV0ZSBH
UFUgdG8gdGhlIFZNLCB3aGljaCBJIHRoaW5rIGlzIGRlZmluaXRlbHkgZG9hYmxlPykuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gU28gZmFyLCBJIGNhbiBkbyBhbGwgdGhlIHFlbXUva3ZtL3ZmaW8vaW9t
bXUgc3R1ZmYgdG8gcnVuIHRoZSBWTSBhbmQKPiA+ID4gPiA+IHBhc3MgdGhlIGludGVncmF0ZWQg
R1BVIHRvIGl0LCBidXQgdGhlIGRybSBkcml2ZXIgaW4gdGhlIFZNIGZhaWxzCj4gPiA+ID4gPiBk
dXJpbmcgYW1kZ3B1X2RldmljZV9pbml0KCkuIFNwZWNpZmljYWxseSwgdGhlIGxvZ3Mgc2hvdyB0
aGUgU01VIGJlaW5nCj4gPiA+ID4gPiB1bnJlc3BvbnNpdmUsIHdoaWNoIGxlYWRzIHRvIGEgJ1NN
VSBmaXJtd2FyZSBsb2FkIGZhaWxlZCcgZXJyb3IKPiA+ID4gPiA+IG1lc3NhZ2UgYW5kIGtlcm5l
bCBwYW5pYy4gSSBjYW4gc2hhcmUgVk0gbG9ncyBhbmQgdGhlIGludm9jYXRpb24gb2YKPiA+ID4g
PiA+IHFlbXUgYW5kIHN1Y2ggaWYgaGVscGZ1bCwgYnV0IGZpcnN0IHdhbnRlZCB0byBrbm93IGF0
IGEgaGlnaCBsZXZlbCBpZgo+ID4gPiA+ID4gdGhpcyBzaG91bGQgYmUgZmVhc2libGU/Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gUC5TLjogSSdtIG5vdCBpbml0aWFsaXppbmcgdGhlIEdQVSBpbiB0aGUg
aG9zdCBiaW9zIG9yIGhvc3Qga2VybmVsIGF0Cj4gPiA+ID4gPiBhbGwsIHNvIEkgc2hvdWxkIGJl
IHBhc3NpbmcgYSBmcmVzaCBHUFUgdG8gdGhlIFZNLiBBbHNvLCBJJ20gcHJldHR5Cj4gPiA+ID4g
PiBzdXJlIEknbSBydW5uaW5nIHRoZSBjb3JyZWN0IFZHQSBiaW9zIGZvciB0aGlzIEdQVSBpbiB0
aGUgZ3Vlc3QgVk0KPiA+ID4gPiA+IGJpb3MgYmVmb3JlIGd1ZXN0IGJvb3QuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gQW55IGNvbW1lbnRzL3N1Z2dlc3Rpb25zIHdvdWxkIGJlIGFwcHJlY2lhdGVkIQo+
ID4gPiA+Cj4gPiA+ID4gSXQgc2hvdWxkIHdvcmsgaW4gYXQgbGVhc3Qgb25jZSBhcyBsb25nIGFz
IHlvdXIgdm0gaXMgcHJvcGVybHkgc2V0IHVwLgo+ID4gPgo+ID4gPiBJcyB0aGVyZSBhbnkgcmVh
c29uIHJ1bm5pbmcgY29yZWJvb3QgdnMgVUVGSSBhdCBob3N0IGJvb3Qgd291bGQgbWFrZSBhCj4g
PiA+IGRpZmZlcmVuY2U/IEkgd2FzIHJ1bm5pbmcgYSBtb2RpZmllZCB2ZXJzaW9uIG9mIGNvcmVi
b290IHRoYXQgYXZvaWRzCj4gPiA+IGRvaW5nIGFueSBHUFUgaW5pdGlhbGl6YXRpb24gaW4gZmly
bXdhcmUgLS0gc28gdGhlIGZpcnN0IFBPU1QgaGFwcGVucwo+ID4gPiBpbnNpZGUgdGhlIGd1ZXN0
Lgo+ID4KPiA+IFRoZSBHUFUgb24gQVBVcyBzaGFyZXMgYSBidW5jaCBvZiByZXNvdXJjZXMgd2l0
aCB0aGUgQ1BVLiAgVGhlcmUgYXJlIGEKPiA+IGJ1bmNoIG9mIGJsb2NrcyB3aGljaCBhcmUgc2hh
cmVkIGFuZCBuZWVkIHRvIGJlIGluaXRpYWxpemVkIG9uIGJvdGgKPiA+IGZvciBldmVyeXRoaW5n
IHRvIHdvcmsgcHJvcGVybHkuCj4KPiBJbnRlcmVzdGluZy4gU28gc2tpcHBpbmcgcnVubmluZyB0
aGUgdmJpb3MgaW4gdGhlIGhvc3QgYW5kIHdhaXRpbmcKPiB1bnRpbCBydW5uaW5nIGl0IGZvciB0
aGUgZmlyc3QgdGltZSBpbiB0aGUgZ3Vlc3QgU2VhQklPUyBpcyBhIGJhZAo+IGlkZWE/IFdvdWxk
IGl0IGJlIGJldHRlciB0byBsZXQgQVBVK0NQVSBpbml0aWFsaXplIG5vcm1hbGx5IGluIHRoZQo+
IGhvc3QgYW5kIHRoZW4gc2tpcCB0cnlpbmcgdG8gcnVuIHRoZSB2YmlvcyBpbiBndWVzdCBTZWFC
SU9TIGFuZCBqdXN0Cj4gZG8gc29tZSBraW5kIG9mIHJlc2V0IGJlZm9yZSB0aGUgZHJtIGRyaXZl
ciBzdGFydHMgYWNjZXNzaW5nIGl0IGZyb20KPiB0aGUgZ3Vlc3Q/CgpJZiB5b3UgbGV0IHRoZSBz
YmlvcyBpbml0aWFsaXplIHRoaW5ncywgaXQgc2hvdWxkIHdvcmsuICBUaGUgZHJpdmVyCndpbGwg
ZG8gdGhlIHJpZ2h0IHRoaW5nIHRvIGluaXQgdGhlIGNhcmQgd2hlbiBpdCBsb2FkcyB3aGV0aGVy
IGl0cwpydW5uaW5nIG9uIGJhcmUgbWV0YWwgb3IgaW4gYSBWTS4gIFdlJ3ZlIG5ldmVyIHRlc3Rl
ZCBhbnkgc2NlbmFyaW9zCndoZXJlIHRoZSBHUFUgb24gQVBVcyBpcyBub3QgaGFuZGxlZCBieSB0
aGUgc2Jpb3MuICBOb3RlIHRoYXQgdGhlIEdQVQpkb2VzIG5vdCBoYXZlIHRvIGJlIHBvc3RlZCBw
ZXIgc2UsIGl0IGp1c3QgbmVlZHMgdG8gaGF2ZSBiZWVuIHByb3Blcmx5CnRha2VuIGludG8gYWNj
b3VudCB3aGVuIHRoZSBzYmlvcyBjb21lcyB1cCBzbyB0aGF0IHNoYXJlZCBjb21wb25lbnRzCmFy
ZSBpbml0aWFsaXplZCBjb3JyZWN0bHkuICBJIGRvbid0IGtub3cgd2hhdCB5b3VyIHBhdGNoZWQg
c3lzdGVtIGRvZXMKb3IgZG9lc24ndCBkbyB3aXRoIHJlc3BlY3QgdG8gdGhlIHBsYXRmb3JtIGlu
aXRpYWxpemF0aW9uLgoKPgo+ID4KPiA+ID4KPiA+ID4gPiBOb3RlIHRoYXQgdGhlIGRyaXZlciBu
ZWVkcyBhY2Nlc3MgdG8gdGhlIHZiaW9zIGltYWdlIGluIHRoZSBndWVzdCB0bwo+ID4gPiA+IGdl
dCBkZXZpY2Ugc3BlY2lmaWMgY29uZmlndXJhdGlvbiBkZXRhaWxzIChjbG9ja3MsIGRpc3BsYXkg
Y29ubmVjdG9yCj4gPiA+ID4gY29uZmlndXJhdGlvbiwgZXRjLikuCj4gPiA+Cj4gPiA+IElzIHRo
ZXJlIGFueXRoaW5nIEkgbmVlZCB0byBkbyB0byBlbnN1cmUgdGhpcyBiZXNpZGVzIHBhc3Npbmcg
Jy1kZXZpY2UKPiA+ID4gdmZpby1wY2ksLi4uLHJvbWZpbGU9L3BhdGgvdG8vdmdhcm9tJyB0byBx
ZW11Pwo+ID4KPiA+IFlvdSBuZWVkIHRoZSBhY3R1YWwgdmJpb3Mgcm9tIGltYWdlIGZyb20geW91
ciBzeXN0ZW0uICBUaGUgaW1hZ2UgaXMKPiA+IGJvYXJkIHNwZWNpZmljLgo+Cj4gSSBzaG91bGQg
aGF2ZSB0aGUgY29ycmVjdCB2YmlvcyByb20gaW1hZ2UgZm9yIG15IGJvYXJkLiBJJ20gZXh0cmFj
dGluZwo+IGl0IGZyb20gdGhlIGZpcm13YXJlIGltYWdlICh0aGF0IHdvcmtzIGZvciByZWd1bGFy
IGdyYXBoaWNzIGluaXQKPiB3aXRob3V0IHRoaXMgVk0gc3R1ZmYpIGZvciB0aGUgYm9hcmQgYXQg
YnVpbGQgdGltZSAocmF0aGVyIHRoYW4KPiBncmFiYmluZyBpdCBmcm9tIC9zeXMvZGV2aWNlcy9w
Y2kuLi4gYXQgcnVudGltZSksIHNvIGl0IHNob3VsZG4ndCBiZQo+IG1vZGlmaWVkIG9yIGNvcnJ1
cHRlZCBpbiBhbnkgd2F5LgoKVGhlIHZiaW9zIGltYWdlIGlzIHBhdGNoZWQgYXQgYm9vdCB0aW1l
IGJ5IHRoZSBzYmlvcyBpbWFnZSBmb3IgcnVuCnRpbWUgY29uZmlndXJhdGlvbiBzdHVmZi4gIEZv
ciBleGFtcGxlLCBzb21lIG9mIHRoZSBwY2llIGxhbmVzIGFyZQpzaGFyZWQgd2l0aCBkaXNwbGF5
IGxhbmVzIGFuZCBjYW4gYmUgdXNlZCBmb3IgZWl0aGVyIGRpc3BsYXkgb3IgcGNpZQphZGQgaW4g
Y2FyZHMuICBUaGUgc2Jpb3MgZGV0ZXJtaW5lcyB0aGlzIGF0IGJvb3QgYW5kIHBhdGNoZXMgdGhl
IHZiaW9zCmRpc3BsYXkgdGFibGVzIHNvIHRoZSBkcml2ZXIga25vd3MgdGhhdCB0aGUgZGlzcGxh
eXMgYXJlIG5vdAphdmFpbGFibGUuICBBbHNvIHRoaW5ncyBsaWtlIGZsYXQgcGFuZWxzIG9uIGxh
cHRvcHMuICBPRU1zIG1heSBoYXZlCnNldmVyYWwgZGlmZmVyZW50IGZsYXQgcGFuZWwgbW9kZWxz
IHRoZXkgdXNlIHdpdGggYSBwYXJ0aWN1bGFyCnBsYXRmb3JtIGFuZCB0aGUgc2Jpb3MgcGF0Y2hl
cyB0aGUgdmJpb3MgZGlzcGxheSB0YWJsZXMgd2l0aCB0aGUKcHJvcGVyIHBhcmFtZXRlcnMgZm9y
IHRoZSBwYW5lbCBpbiB1c2UuICBUaGUgc2Jpb3MgYWxzbyBwYXRjaGVzIHRhYmxlcwpyZWxhdGVk
IHRvIGJhbmR3aWR0aC4gIEUuZy4sIHRoZSB0eXBlIGFuZCBzcGVlZCBhbmQgbnVtYmVyIG9mIGNo
YW5uZWxzCm9mIHRoZSBzeXN0ZW0gcmFtIHNvIHRoYXQgdGhlIEdQVSBkcml2ZXIgY2FuIHNldCBw
cm9wZXIgbGltaXRzIG9uCnRoaW5ncyBsaWtlIGRpc3BsYXkgbW9kZXMuICBTbyB5b3UgbmVlZCB0
byB1c2UgdGhlIHZiaW9zIGltYWdlIHRoYXQgaXMKcHJvdmlkZWQgYnkgdGhlIHNiaW9zIGF0IGJv
b3QuCgpBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
