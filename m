Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189F81752E5
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Mar 2020 05:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB666E049;
	Mon,  2 Mar 2020 04:53:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F343E6E055
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Mar 2020 04:53:37 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id h62so9794477edd.12
 for <amd-gfx@lists.freedesktop.org>; Sun, 01 Mar 2020 20:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IFZLqUTW25ctTVtDi96LYB3OSGc6XXXjI3GYykXZA54=;
 b=mGHIHalnZt1Rq9vbfcOS54fyFe6pufTBr3Ktw8eBYKH+bseJvkpgME2dv9F7f057xn
 0yTRKNwExXWOiOlj7LUdxF6z81LDKsCK/lRXbQEhp3IgrMdNlUzdUy8RAJr0edbBg72e
 re/ZXEkgg9MDrnGqFqy67a7G/LLhe45C9C46jBseccBNnKt45Ofb8MsxYH8BhKUr6wLt
 AcPjt4NJ+sjR+UhCR7YZq8lkl1iN3m6TqR9BTu9L+GR5Q/L1cObpakyD5fkHalDTAynw
 pfGSmeQAUzTR9fIBlH0YjW6HgLyunCRAmJR9J/bJItP0oNX0n04GmF35qcWR8n1zy/DQ
 jD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IFZLqUTW25ctTVtDi96LYB3OSGc6XXXjI3GYykXZA54=;
 b=oaguOCRZfiDSnpFzKZW8B7XI4CBdwLOpHqtZeySRg7awj3CHax8QWRaaaHVu1DIo7w
 55wECCyLs2fopoqsxhiiRzZIeXvAkUcSeFKB1iIvLgZqiuVtXKISdiYDl0U6KJK53Zp/
 ti96x0Ql2h+nh1n8KQo+ipmji+SpaChKXmEhS2hJrl8FoD8gXnyAKmQBDDb83v7EPr/o
 CoSmxOXJVwR4qNMWWOJIJ81FpJvJcfrFmZxGrJr7WD2k/bpa0VfHEvwpSQPjyIzixCwi
 PdBNsyLQbd4eYOGSP6yBGL+ZBhu8hBFnkowSXWuyZonZZNIFAWaPRK+typJe0qwUn+EO
 YwIQ==
X-Gm-Message-State: APjAAAVuGLrV9onIprl65Qep/rXwMKSa+DJL6pf2nih8JtCJG/dlC7EM
 Twr+1cHTt674BiKCHAc+YVpl4J3BMSzWb4nWnVsU5w==
X-Google-Smtp-Source: APXvYqx6IFkF41k29nz0lnOnTZtVRAl7JUKF+OxBDo2ZLu7LFtPDsAqfil5lUjZgE0yyJT9Z47V6IFF8ua/M8IJBMwU=
X-Received: by 2002:a05:6402:6c2:: with SMTP id
 n2mr14094451edy.241.1583124816249; 
 Sun, 01 Mar 2020 20:53:36 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <b398161ff7d0268454413058dc6c194cf93f5990.camel@collabora.com>
 <ece8ebe3-40ec-2457-02da-4fef19cbe8f6@intel.com>
 <6d2ec570f957b4504fb70e0b1f0632712a99dc0c.camel@collabora.com>
 <CAPj87rO7BuKQj2Kei3T7RdkFq5=TiuShBvtrPU2sn0iqMfXSTg@mail.gmail.com>
 <59f4ea1f13a9a9d37f7801b93061b4ae7dd595e2.camel@gmail.com>
 <d0ef47e45c83b342494e6781b808b4831a008836.camel@ndufresne.ca>
 <9b0b31b8-7610-d5c5-790a-617178cc8c1e@daenzer.net>
 <93d7158b1ab49e51d14d991d5bdb2dba38ad6025.camel@ndufresne.ca>
 <CAC2bXD5OzDYtAcWAhpM_7Wwkbp2hpRszejjA7d0rqoypVdyDvA@mail.gmail.com>
 <17097bfa848.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <8249d1d87a990d63a2743ecf2acb910e5992478a.camel@ndufresne.ca>
In-Reply-To: <8249d1d87a990d63a2743ecf2acb910e5992478a.camel@ndufresne.ca>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Sun, 1 Mar 2020 22:53:25 -0600
Message-ID: <CAOFGe96JJki2u0QJckVrpg_d==mmRvPTmJXBLws+mCGLLf1X_A@mail.gmail.com>
Subject: Re: [Intel-gfx] [Mesa-dev] gitlab.fd.o financial situation and impact
 on services
To: Nicolas Dufresne <nicolas@ndufresne.ca>
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Erik Faye-Lund <erik.faye-lund@collabora.com>,
 Jacob Lifshay <programmerjake@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXIgMSwgMjAyMCBhdCAyOjQ5IFBNIE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNA
bmR1ZnJlc25lLmNhPiB3cm90ZToKPgo+IEhpIEphc29uLAo+Cj4gSSBwZXJzb25hbGx5IHRoaW5r
IHRoZSBzdWdnZXN0aW9uIGFyZSBzdGlsbCBhIHJlbGF0aXZlbHkgZ29vZAo+IGJyYWluc3Rvcm0g
ZGF0YSBmb3IgdGhvc2UgaW1wbGljYXRlZC4gT2YgY291cnNlLCB0aG9zZSBub3QgaW1wbGljYXRl
ZAo+IGluIHRoZSBDSSBzY3JpcHRpbmcgaXRzZWxmLCBJJ2Qgc2F5IGp1c3Qga2VlcCBpbiBtaW5k
IHRoYXQgbm90aGluZyBpcwo+IGJsYWNrIGFuZCB3aGl0ZSBhbmQgZXZlcnkgY2hhbmdlcyBlbmQt
dXAgYmVpbmcgdGltZSBjb25zdW1pbmcuCgpTb3JyeS4gIEkgZGlkbid0IGludGVuZCB0byBzdG9w
IGEgdXNlZnVsIGJyYWluc3Rvcm1pbmcgc2Vzc2lvbi4gIEknbQpqdXN0IHRyeWluZyB0byBzYXkg
dGhhdCBDSSBpcyB1c2VmdWwgYW5kIHdlIHNob3VsZG4ndCBodXJ0IG91cgpkZXZlbG9wbWVudCBm
bG93cyBqdXN0IHRvIHNhdmUgYSBsaXR0bGUgbW9uZXkgdW5sZXNzIHdlJ3JlIHRydWx5CmRlc3Bl
cmF0ZS4gIEZyb20gd2hhdCBJIHVuZGVyc3RhbmQsIEkgZG9uJ3QgdGhpbmsgd2UncmUgdGhhdCBk
ZXNwZXJhdGUKeWV0LiAgU28gSSB3YXMgbW9zdGx5IHRyeWluZyB0byByZS1mb2N1cyB0aGUgZGlz
Y3Vzc2lvbiB0b3dhcmRzCnN0cmFpZ2h0Zm9yd2FyZCB0aGluZ3Mgd2UgY2FuIGRvIHRvIGdldCBy
aWQgb2YgcG9pbnRsZXNzIHdhc3RlICh0aGVyZQpwcm9iYWJseSBpcyBzb21lIHByZXR0eSBsb3ct
aGFuZ2luZyBmcnVpdCkgYW5kIGF3YXkgZnJvbSAiT01HIFgub3JnIGlzCnJ1bm5pbmcgb3V0IG9m
IG1vbmV5OyBDSSBhcyBsaXR0bGUgYXMgcG9zc2libGUiLiAgSSBkb24ndCB0aGluayB5b3UncmUK
c2F5aW5nIHRob3NlIHRoaW5nczsgYnV0IEkndmUgc2Vuc2VkIGEgZ29vZCBiaXQgb2YgZmVhciBp
biB0aGlzCnRocmVhZC4gIChJIGNvdWxkIGp1c3QgYmUgdG90YWxseSBtaXNyZWFkaW5nIHBlb3Bs
ZSwgYnV0IEkgZG9uJ3QgdGhpbmsKc28uKQoKT25lIG9mIHRoZSB0aGluZ3MgdGhhdCBzb21lb25l
IHBvaW50ZWQgb3V0IG9uIHRoaXMgdGhyZWFkIGlzIHRoYXQgd2UKbmVlZCBkYXRhLiAgU29tZSBo
YXMgYmVlbiBwcm92aWRlZCBoZXJlIGJ1dCBpdCdzIHN0aWxsIGEgYml0IHVuY2xlYXIKZXhhY3Rs
eSB3aGF0IHRoZSBicmVhay1kb3duIGlzIHNvIGl0J3MgaGFyZCBmb3IgcGVvcGxlIHRvIGNvbWUg
dXAgd2l0aApnb29kIHNvbHV0aW9ucyBiZXlvbmQgImp1c3QgZG8gbGVzcyBDSSIuICBXZSBkbyBr
bm93IHRoYXQgdGhlIGJpZ2dlc3QKY29zdCBpcyBlZ3Jlc3Mgd2ViIHRyYWZmaWMgYW5kIHRoYXQn
cyBzb21ldGhpbmcgd2UgZGlkbid0IGtub3cgYmVmb3JlLgpNeSB1bmRlcnN0YW5kaW5nIGlzIHRo
YXQgcGVvcGxlIG9uIHRoZSBYLm9yZyBib2FyZCBhbmQvb3IgRGFuaWVsIGFyZQp3b3JraW5nIHRv
IGdldCBiZXR0ZXIgZGF0YS4gIEknbSBmYWlybHkgaG9wZWZ1bCB0aGF0LCBvbmNlIHdlCnVuZGVy
c3RhbmQgYmV0dGVyIHdoYXQgdGhlIGNvc3RzIGFyZSAob3IgZXZlbiB3aXRoIGp1c3QgdGhlIG5l
dyBkYXRhCndlIGhhdmUpLCB3ZSBjYW4gYnJpbmcgaXQgZG93biB0byByZWFzb25hYmxlIGFuZC9v
ciBjb21lIHVwIHdpdGggbW9uZXkKdG8gcGF5IGZvciBpdCBpbiBmYWlybHkgc2hvcnQgb3JkZXIu
CgpBZ2Fpbiwgc29ycnkgSSB3YXMgc28gdGVyc2UuICBJIHdhcyBqdXN0IHRyeWluZyB0byBzbG93
IHRoZSBwYW5pYy4KCj4gTGUgZGltYW5jaGUgMDEgbWFycyAyMDIwIMOgIDE0OjE4IC0wNjAwLCBK
YXNvbiBFa3N0cmFuZCBhIMOpY3JpdCA6Cj4gPiBJJ3ZlIHNlZW4gYSBudW1iZXIgb2Ygc3VnZ2Vz
dGlvbnMgd2hpY2ggd2lsbCBkbyBvbmUgb3IgYm90aCBvZiB0aG9zZSB0aGluZ3MgaW5jbHVkaW5n
Ogo+ID4KPiA+ICAtIEJhdGNoaW5nIG1lcmdlIHJlcXVlc3RzCj4KPiBBZ3JlZWQuIE9yIGF0IGxl
YXN0IEkgZm9yZXNlZSBxdWl0ZSBjb21wbGljYXRlZCBjb2RlIHRvIGhhbmRsZSB0aGUgY2FzZQo+
IG9mIG9uZSBiYXRjaGVkIG1lcmdlIGZhaWxpbmcgdGhlIHRlc3RzLCBvciB3b3JzdCwgd2l0aCBm
bGlja3kgdGVzdHMuCj4KPiA+ICAtIE5vdCBydW5uaW5nIENJIG9uIHRoZSBtYXN0ZXIgYnJhbmNo
Cj4KPiBBIHNtYWxsIGNsYXJpZmljYXRpb24sIHRoaXMgZGVwZW5kcyBvbiB0aGUgY2hvc2VuIHdv
cmstZmxvdy4gSW4KPiBHU3RyZWFtZXIsIHdlIHVzZSBhIHJlYmFzZSBmbG93LCBzbyAibWVyZ2Ui
IGJ1dHRvbiBpc24ndCByZWFsbHkKPiBtZXJnaW5nLiBJdCBtZWFucyB0aGF0IHRvIG1lcmdlIHlv
dSBuZWVkIHlvdXIgYnJhbmNoIHRvIGJlIHJlYmFzZWQgb24KPiB0b3Agb2YgdGhlIGxhdGVzdC4g
QXMgaXQgaXMgbXVsdGktcmVwbywgdGhlcmUgaXMgYWx3YXlzIGEgdGlueSBjaGFuY2UKPiBvZiBi
cmVha2FnZSBkdWUgdG8gbWlkLWFpciBjb2xsaXNpb24gaW4gY2hhbmdlcyBpbiBvdGhlciByZXBv
cy4gV2hhdCB3ZQo+IHNlZSBpcyB0aGF0IHRoZSBwb3N0ICJtZXJnZSIgY2Fubm90IGV2ZW4gY2F0
Y2ggdGhlbSBhbGwgKGFzIHdlIGFscmVhZHkKPiBvYnNlcnZlZCBvbmNlKS4gSW4gZmFjdCwgaXQg
dXN1YWxseSBkb2VzIG5vdCBjYXRjaCBhbnl0aGluZy4gT3IgZWFjaAo+IHRpbWUgaXQgY2FjaGVk
IHNvbWV0aGluZywgd2Ugb25seSBub3RpY2Ugb24gdGhlIG5leHQgTVIuMCBTbyB3ZSBhcmUKPiBy
ZWFsbHkgY29uc2lkZXJpbmcgZG9pbmcgdGhpcyBhcyBmb3IgdGhpcyBzcGVjaWZpYyB3b3JrZmxv
dy9wcm9qZWN0LCB3ZQo+IGZvdW5kIHZlcnkgbGl0dGxlIGdhaW4gb2YgaGF2aW5nIGl0Lgo+Cj4g
V2l0aCByZWFsIG1lcmdlLCB0aGUgY29kZSBiZWluZyB0ZXN0ZWQgYmVmb3JlL2FmdGVyIHRoZSBt
ZXJnZSBpcwo+IGRpZmZlcmVudCwgYW5kIGZvciB0aGF0IEkgYWdyZWUgd2l0aCB5b3UuCgpFdmVu
IHdpdGggYSByZWJhc2UgbW9kZWwsIGl0J3Mgc3RpbGwgcG90ZW50aWFsbHkgZGlmZmVyZW50OyB0
aG91Z2gKbWFyZ2UgcmUtcnVucyBDSSBiZWZvcmUgbWVyZ2luZy4gIEkgYWdyZWUgdGhlIHJpc2sg
aXMgbG93LCBob3dldmVyLAphbmQgaWYgeW91IGhhdmUgR2l0TGFiIHNldCB1cCB0byBibG9jayBN
UnMgdGhhdCBkb24ndCBwYXNzIENJLCB0aGVuCnlvdSBtYXkgYmUgYWJsZSB0byBkcm9wIHRoZSBt
YXN0ZXIgYnJhbmNoIHRvIGEgZGFpbHkgcnVuIG9yIHNvbWV0aGluZwpsaWtlIHRoYXQuICBBZ2Fp
biwgc2hvdWxkIGJlIHByb2plY3QtYnktcHJvamVjdC4KCj4gPiAgLSBTaHV0dGluZyBvZmYgQ0kK
Pgo+IE9mIGNvdXJzZSA6LSksIHNwZWNpYWxseSB0aGF0IHdlIGhhZCBDSSBiZWZvcmUgZ2l0bGFi
IGluIEdTdHJlYW1lcgo+IChqdXN0IG5vdCBwcmUtY29tbWl0KSwgd2UgZG9uJ3Qgd2FudCBhIHJl
Z3Jlc3MgdGhhdCBmYXIgaW4gdGhlIHBhc3QuCj4KPiA+ICAtIFByZXZlbnRpbmcgQ0kgb24gb3Ro
ZXIgbm9uLU1SIGJyYW5jaGVzCj4KPiBBbm90aGVyIHNtYWxsIG51YW5jZSwgbWVzYSBkb2VzIG5v
dCBwcmV2ZW50IENJLCBpdCBvbmx5IG1ha2VzIGl0IG1hbnVhbAo+IG9uIG5vbi1NUi4gVXNlcnMg
Y2FuIGdvIGNsaWNrIHJ1biB0byBnZXQgQ0kgcmVzdWx0cy4gV2UgY291bGQgYWxzbyBoYXZlCj4g
b3B0aW9uIHRvIHRyaWdnZXIgdGhlIGNpICh0aGUgb3Bwb3NpdGUgb2YgY2kuc2tpcCkgZnJvbSBn
aXQgY29tbWFuZAo+IGxpbmUuCgpIZW5jZSBteSB1c2Ugb2YgInByZXZlbnQiLiA6LSkgIEl0J3Mg
dmVyeSB1c2VmdWwgYnV0LCBJTU8sIGl0IHNob3VsZApiZSBvcHQtaW4gYW5kIG5vdCBvcHQtb3V0
LiAgSSB0aGluayB3ZSBhZ3JlZSBoZXJlLiA6LSkKCi0tSmFzb24KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
