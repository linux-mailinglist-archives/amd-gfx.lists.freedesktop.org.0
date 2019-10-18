Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001BFDC661
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 15:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABE96EB53;
	Fri, 18 Oct 2019 13:43:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC1C6EB53
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 13:43:08 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w18so5778729wrt.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 06:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d+alicBfr4747DpiyZWOKC1BtKwTMwce3XI4sc/Adwk=;
 b=imCajH9wWTCU3pp5kKFIB52swwx0KHS2lekRWLTe5PPwYDCSbuYE+J3qJBuejGhoSG
 iA5K8phgcztaptwF0s+OsTOKqAEfaNUUuyE4zTKv2sVUr0IebozkXPlRpb0/U8xVvNfY
 3blP7rW6V2LnWXt7aHAs7B0VGeC+vRnpUerliRe+r4Iddo8OARj6iTIcIbgG3WCUXDDB
 O1C6WFbTzOqp7Kq8UOS0J9eUfMVRkxNNgQr6jt7IMBLzZfQlFobn1g2Reuxgut8+iKPJ
 xlDfrXaf7AdYS03VnjOzSBO/JBiglWcuZLPsMmNKwCol7xsO1aLMevh0bbjUDdy17aZa
 Ny8Q==
X-Gm-Message-State: APjAAAV2TDSo47OohQU7RT4ASyntvhscWsC66XxivExCg9k6DHmhVm3R
 rxSJvlXmzMVL42yiDUAZb7gxGuEbJlFRkCifH20=
X-Google-Smtp-Source: APXvYqz7tX2mlAHQT9UsT7XOIi+t6V9Em5DNjMj0HRBGozoewrdurEH8NW61u+mOaDGbEsoJc5aRJlPC+pm5SARkXS8=
X-Received: by 2002:adf:a547:: with SMTP id j7mr7815919wrb.154.1571406186636; 
 Fri, 18 Oct 2019 06:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHL+j0_2ir=8hHDoyqizweOUSV6XfqC-UCD15WuJ9vvptNLr0g@mail.gmail.com>
 <CADnq5_N0r8O2vQapGaary0L-OfdTdz-ezcMJK90+Gy2sPujYcw@mail.gmail.com>
 <CAHL+j08qsu1pSOZPLB9-XWw9ZmT2OamaWPBJV4T3Vzx_C8cD7g@mail.gmail.com>
 <67658520-b3f4-d2f9-7247-dd434ab5c30b@amd.com>
 <CAHL+j0-Nm+6VFXi_w4iciNdG40zubpqvh1RXs3MFfXJK2mFr0Q@mail.gmail.com>
 <CAHL+j0_=r1XBOzwiQmbZTVoRsZ5=Du3pAPd_n7pia81FegdHhw@mail.gmail.com>
 <57826a9e-5842-4ddd-a456-67d1d1b9a9ce@amd.com>
 <CAHL+j0-NJ8F4RpMJ5m9_9gk_t+zhwFwVmG6MMy4TBYa4XjnWEA@mail.gmail.com>
In-Reply-To: <CAHL+j0-NJ8F4RpMJ5m9_9gk_t+zhwFwVmG6MMy4TBYa4XjnWEA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Oct 2019 09:42:51 -0400
Message-ID: <CADnq5_MTYe5z0gbtY0eCnUax2D=HZYBQF7YWPS86pikDXGVWOA@mail.gmail.com>
Subject: Re: Spontaneous reboots when using RX 560
To: Sylvain Munaut <246tnt@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=d+alicBfr4747DpiyZWOKC1BtKwTMwce3XI4sc/Adwk=;
 b=Bto5joXZxMzMJ46SeURYyoRk0XUZ9F19YPxNkkse64n4Jrlu58+Cj5zGNAMX/ehtxh
 Vq71N1l9Bh1WhikggG/l9qnso0UkTYzFh4GjJfYb91skSORKXA1W3bmwxj6A92LICOv3
 MG4hVHVu2W3kV+4RLklQvzWW7EwGVm9KbpYUXMi+5Z5TxCxAWbe8VQccLckiZY68PcD4
 BqGY8gmsnQn1cI2Vl6vX+ZWQGmw7lJIN8Ni5nK/ipc2Xsk9LGLFppBjCWis9sVzfDJiB
 DFFtjOMZ3QMWtLlAIXTNviAF7Q6JnuXOGsA788TWoTwjk/0G0wp2hiWCZ4HSmOKbGemK
 8ASQ==
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RG9lcyBkaXNhYmxpbmcgdGhlIElPTU1VIGhlbHA/ICBFLmcuLCBhcHBlbmQgSU9NTVU9b2ZmIG9y
IElPTU1VPXB0IG9uCnRoZSBrZXJuZWwgY29tbWFuZCBsaW5lIGluIGdydWIuCgpBbGV4CgpPbiBG
cmksIE9jdCAxOCwgMjAxOSBhdCA4OjA2IEFNIFN5bHZhaW4gTXVuYXV0IDwyNDZ0bnRAZ21haWwu
Y29tPiB3cm90ZToKPgo+IEhpIENocmlzdGlhbiwKPgo+Cj4gPiBJIHdvdWxkIGFsc28gdGVzdCBp
ZiBkaXNhYmxpbmcgcG93ZXIgZmVhdHVyZXMgaGVscHMgYXMgd2VsbCwgdHJ5IHRvIGFkZAo+ID4g
YW1kZ3B1LnBnX21hc2s9MCBhbmQgYW1kZ3B1LmNnX21hc2s9MCB0byB0aGUga2VybmVsIGNvbW1h
bmQgbGluZSBmb3IKPiA+IGV4YW1wbGUuCj4KPiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLgo+
IEp1c3QgdHJpZWQgdGhpcywgbm8gbHVjay4gQWxzbyB0cmllZCAncnVucG09MCcgKGJ1dCBhcHBh
cmVudGx5IHRoYXQncwo+IGZvciBsYXB0b3Agb25seSBzbyAuLi4pCj4KPiBFdmVuIHdpdGggY2df
bWFzaz0wLCBJIHN0aWxsIHNlZSB0aGlzIGluIGFtZGdwdV9wbV9pbmZvLCBub3Qgc3VyZSBpZgo+
IHRoYXQncyBleHBlY3RlZCBvZiBpZiBzb21laG93IHRoZSBvcHRpb24gd2FzIGlnbm9yZWQgPwo+
Cj4gLS0tLQo+IENsb2NrIEdhdGluZyBGbGFncyBNYXNrOiAweDE2YjAwCj4gICAgICAgICBHcmFw
aGljcyBNZWRpdW0gR3JhaW4gQ2xvY2sgR2F0aW5nOiBPZmYKPiAgICAgICAgIEdyYXBoaWNzIE1l
ZGl1bSBHcmFpbiBtZW1vcnkgTGlnaHQgU2xlZXA6IE9mZgo+ICAgICAgICAgR3JhcGhpY3MgQ29h
cnNlIEdyYWluIENsb2NrIEdhdGluZzogT2ZmCj4gICAgICAgICBHcmFwaGljcyBDb2Fyc2UgR3Jh
aW4gbWVtb3J5IExpZ2h0IFNsZWVwOiBPZmYKPiAgICAgICAgIEdyYXBoaWNzIENvYXJzZSBHcmFp
biBUcmVlIFNoYWRlciBDbG9jayBHYXRpbmc6IE9mZgo+ICAgICAgICAgR3JhcGhpY3MgQ29hcnNl
IEdyYWluIFRyZWUgU2hhZGVyIExpZ2h0IFNsZWVwOiBPZmYKPiAgICAgICAgIEdyYXBoaWNzIENv
bW1hbmQgUHJvY2Vzc29yIExpZ2h0IFNsZWVwOiBPZmYKPiAgICAgICAgIEdyYXBoaWNzIFJ1biBM
aXN0IENvbnRyb2xsZXIgTGlnaHQgU2xlZXA6IE9mZgo+ICAgICAgICAgR3JhcGhpY3MgM0QgQ29h
cnNlIEdyYWluIENsb2NrIEdhdGluZzogT2ZmCj4gICAgICAgICBHcmFwaGljcyAzRCBDb2Fyc2Ug
R3JhaW4gbWVtb3J5IExpZ2h0IFNsZWVwOiBPZmYKPiAgICAgICAgIE1lbW9yeSBDb250cm9sbGVy
IExpZ2h0IFNsZWVwOiBPbgo+ICAgICAgICAgTWVtb3J5IENvbnRyb2xsZXIgTWVkaXVtIEdyYWlu
IENsb2NrIEdhdGluZzogT24KPiAgICAgICAgIFN5c3RlbSBEaXJlY3QgTWVtb3J5IEFjY2VzcyBM
aWdodCBTbGVlcDogT2ZmCj4gICAgICAgICBTeXN0ZW0gRGlyZWN0IE1lbW9yeSBBY2Nlc3MgTWVk
aXVtIEdyYWluIENsb2NrIEdhdGluZzogT24KPiAgICAgICAgIEJ1cyBJbnRlcmZhY2UgTWVkaXVt
IEdyYWluIENsb2NrIEdhdGluZzogT2ZmCj4gICAgICAgICBCdXMgSW50ZXJmYWNlIExpZ2h0IFNs
ZWVwOiBPZmYKPiAgICAgICAgIFVuaWZpZWQgVmlkZW8gRGVjb2RlciBNZWRpdW0gR3JhaW4gQ2xv
Y2sgR2F0aW5nOiBPbgo+ICAgICAgICAgVmlkZW8gQ29tcHJlc3Npb24gRW5naW5lIE1lZGl1bSBH
cmFpbiBDbG9jayBHYXRpbmc6IE9uCj4gICAgICAgICBIb3N0IERhdGEgUGF0aCBMaWdodCBTbGVl
cDogT2ZmCj4gICAgICAgICBIb3N0IERhdGEgUGF0aCBNZWRpdW0gR3JhaW4gQ2xvY2sgR2F0aW5n
OiBPbgo+ICAgICAgICAgRGlnaXRhbCBSaWdodCBNYW5hZ2VtZW50IE1lZGl1bSBHcmFpbiBDbG9j
ayBHYXRpbmc6IE9mZgo+ICAgICAgICAgRGlnaXRhbCBSaWdodCBNYW5hZ2VtZW50IExpZ2h0IFNs
ZWVwOiBPZmYKPiAgICAgICAgIFJvbSBNZWRpdW0gR3JhaW4gQ2xvY2sgR2F0aW5nOiBPZmYKPiAg
ICAgICAgIERhdGEgRmFicmljIE1lZGl1bSBHcmFpbiBDbG9jayBHYXRpbmc6IE9mZgo+ICAgICAg
ICAgQWRkcmVzcyBUcmFuc2xhdGlvbiBIdWIgTWVkaXVtIEdyYWluIENsb2NrIEdhdGluZzogT2Zm
Cj4gICAgICAgICBBZGRyZXNzIFRyYW5zbGF0aW9uIEh1YiBMaWdodCBTbGVlcDogT2ZmCj4KPiBH
RlggQ2xvY2tzIGFuZCBQb3dlcjoKPiAgICAgICAgIDMwMCBNSHogKE1DTEspCj4gICAgICAgICAy
MTQgTUh6IChTQ0xLKQo+ICAgICAgICAgMzg3IE1IeiAoUFNUQVRFX1NDTEspCj4gICAgICAgICA2
MjUgTUh6IChQU1RBVEVfTUNMSykKPiAgICAgICAgIDc3NSBtViAoVkRER0ZYKQo+ICAgICAgICAg
Ny4yNTQgVyAoYXZlcmFnZSBHUFUpCj4KPiBHUFUgVGVtcGVyYXR1cmU6IDM0IEMKPiBHUFUgTG9h
ZDogMCAlCj4gTUVNIExvYWQ6IDYgJQo+Cj4gVVZEOiBEaXNhYmxlZAo+Cj4gVkNFOiBEaXNhYmxl
ZAo+IC0tLS0KPgo+IEknbSBub3QgcmVhbGx5IHN1cmUgd2hhdCB0byB0cnkgbmV4dC4gSSB1bmZv
cnR1bmF0ZWx5IGRvbid0IGhhdmUKPiBhY2Nlc3MgdG8gYW55IG90aGVyIGNhcmQgb3IgYW55IG90
aGVyIG1vdGhlcmJvYXJkIEkgY291bGQgdXNlIHRvIHRlc3QKPiA6Lwo+IChPciBhbnl0aGluZyBm
YW5jeSBsaWtlIHBjaWUgYnVzIGFuYWx5emVyIG9yIHN0dWZmIGxpa2UgdGhhdCkuCj4KPiBNeSB1
bmRlcnN0YW5kaW5nIG9mIHRoZSBmaXJzdCBlcnJvciBtZXNzYWdlIHRoYXQgc2hvd3MgdXAgaXMg
dGhhdCB0aGUKPiBjYXJkIGl0c2VsZiB0cmllcyB0byBtYWtlIGFuIGFjY2VzcyB0byBhIG1lbW9y
eSB6b25lIGl0J3Mgbm90IGFsbG93ZWQKPiB0byByaWdodCA/Cj4gWyAgMTQ0LjMxMTcwNF0gYW1k
Z3B1IDAwMDA6MDY6MDAuMDogQU1ELVZpOiBFdmVudCBsb2dnZWQKPiBbSU9fUEFHRV9GQVVMVCBk
b21haW49MHgwMDAwIGFkZHJlc3M9MHhhMDc2MDEwMTAwIGZsYWdzPTB4MDAxMF0KPgo+IENoZWVy
cywKPgo+ICAgICBTeWx2YWluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
