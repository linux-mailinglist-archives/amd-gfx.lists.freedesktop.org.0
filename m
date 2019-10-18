Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B00DDDC45D
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 14:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355166EB2F;
	Fri, 18 Oct 2019 12:06:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14EA6EB2F
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 12:06:40 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b9so6007016wrs.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 05:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8/07L81I4k1V/EBTzD0kbGmZYI7h5cBRdwNSa0v4nJ4=;
 b=rSZwUXk1ddPh4Pzxnk4zBgDBmoyyk2w1aFKSEdyvflLQL0j6YNfmWppY+Hk8BJ75RY
 jiouNpcZilqZUYoWK/DpS6kOzAOJAO4IfaqpFaApHtqOdmGUpfLvTGcJZEUuN+EaTHSb
 x8WkVHrb+/zmlTIr6LNPzi4/8cp39KhmRmuWcPe3zqnWbt09VrfeEWMX6eq4BMLZl8b1
 q2PVbriyMFudnn2tefeyP14rsYdvkomgWuoLQ8k80WGrsbiSSPvhCq48yRSTT0fKBN78
 XyNwgkWFOUHmKFyusSkDgnPGlvCmaATb4+FlF5kRs0+57nCz++LEaCQgeqdn5kFeomW4
 5PqQ==
X-Gm-Message-State: APjAAAVW6wyyCOGJAdmZKvcnoCnYkG4m0kqTkl0EKBrbyNPyCEObHX/B
 omr7YZ/nzKUI3K5BCmZAt6DnTJG+5GDmFRlis98=
X-Google-Smtp-Source: APXvYqxnHfkkfUzS+cORisGhoWmza6xNLbLLAs3PQ/oZ+CNoD3vKdfU6x9NTgf8sOPV0vYK2aBp/yi37eoy96YOzsYI=
X-Received: by 2002:a5d:440b:: with SMTP id z11mr7193816wrq.309.1571400399092; 
 Fri, 18 Oct 2019 05:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHL+j0_2ir=8hHDoyqizweOUSV6XfqC-UCD15WuJ9vvptNLr0g@mail.gmail.com>
 <CADnq5_N0r8O2vQapGaary0L-OfdTdz-ezcMJK90+Gy2sPujYcw@mail.gmail.com>
 <CAHL+j08qsu1pSOZPLB9-XWw9ZmT2OamaWPBJV4T3Vzx_C8cD7g@mail.gmail.com>
 <67658520-b3f4-d2f9-7247-dd434ab5c30b@amd.com>
 <CAHL+j0-Nm+6VFXi_w4iciNdG40zubpqvh1RXs3MFfXJK2mFr0Q@mail.gmail.com>
 <CAHL+j0_=r1XBOzwiQmbZTVoRsZ5=Du3pAPd_n7pia81FegdHhw@mail.gmail.com>
 <57826a9e-5842-4ddd-a456-67d1d1b9a9ce@amd.com>
In-Reply-To: <57826a9e-5842-4ddd-a456-67d1d1b9a9ce@amd.com>
From: Sylvain Munaut <246tnt@gmail.com>
Date: Fri, 18 Oct 2019 14:07:00 +0200
Message-ID: <CAHL+j0-NJ8F4RpMJ5m9_9gk_t+zhwFwVmG6MMy4TBYa4XjnWEA@mail.gmail.com>
Subject: Re: Spontaneous reboots when using RX 560
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8/07L81I4k1V/EBTzD0kbGmZYI7h5cBRdwNSa0v4nJ4=;
 b=T5G5MEkqojzjvdPYCejwsCaG9vygl3nohxgntdZQa1DrwfpOg/13w5lY9cgeaKVwZQ
 3vZMcjNAgiliKC7u4aXZb+Z33feLPySw3/PhBi6h3xqbpCUjqZQB3aQcbUsLbrCASqPN
 /B4UAc8oWRfMfsMBOBqaiKmean0mERy16iBB4xcZjMCZhpiIX8OFK371JA4yAOe5HsGO
 YKZ5nsDyldYN0a5m8WVD5DqwIDpNi1VrtyJAF9pyyUw6zCzPw/7hFD85Sxj+fUfg02k/
 Iky1GP2O65NumO33WLan5jVoYZIoS1KADf/GJzguIHfrNyppBSqwR8mqhxBAoehmhF/K
 HXCw==
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
Cc: Alex Deucher <alexdeucher@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKCj4gSSB3b3VsZCBhbHNvIHRlc3QgaWYgZGlzYWJsaW5nIHBvd2VyIGZl
YXR1cmVzIGhlbHBzIGFzIHdlbGwsIHRyeSB0byBhZGQKPiBhbWRncHUucGdfbWFzaz0wIGFuZCBh
bWRncHUuY2dfbWFzaz0wIHRvIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lIGZvcgo+IGV4YW1wbGUu
CgpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLgpKdXN0IHRyaWVkIHRoaXMsIG5vIGx1Y2suIEFs
c28gdHJpZWQgJ3J1bnBtPTAnIChidXQgYXBwYXJlbnRseSB0aGF0J3MKZm9yIGxhcHRvcCBvbmx5
IHNvIC4uLikKCkV2ZW4gd2l0aCBjZ19tYXNrPTAsIEkgc3RpbGwgc2VlIHRoaXMgaW4gYW1kZ3B1
X3BtX2luZm8sIG5vdCBzdXJlIGlmCnRoYXQncyBleHBlY3RlZCBvZiBpZiBzb21laG93IHRoZSBv
cHRpb24gd2FzIGlnbm9yZWQgPwoKLS0tLQpDbG9jayBHYXRpbmcgRmxhZ3MgTWFzazogMHgxNmIw
MAogICAgICAgIEdyYXBoaWNzIE1lZGl1bSBHcmFpbiBDbG9jayBHYXRpbmc6IE9mZgogICAgICAg
IEdyYXBoaWNzIE1lZGl1bSBHcmFpbiBtZW1vcnkgTGlnaHQgU2xlZXA6IE9mZgogICAgICAgIEdy
YXBoaWNzIENvYXJzZSBHcmFpbiBDbG9jayBHYXRpbmc6IE9mZgogICAgICAgIEdyYXBoaWNzIENv
YXJzZSBHcmFpbiBtZW1vcnkgTGlnaHQgU2xlZXA6IE9mZgogICAgICAgIEdyYXBoaWNzIENvYXJz
ZSBHcmFpbiBUcmVlIFNoYWRlciBDbG9jayBHYXRpbmc6IE9mZgogICAgICAgIEdyYXBoaWNzIENv
YXJzZSBHcmFpbiBUcmVlIFNoYWRlciBMaWdodCBTbGVlcDogT2ZmCiAgICAgICAgR3JhcGhpY3Mg
Q29tbWFuZCBQcm9jZXNzb3IgTGlnaHQgU2xlZXA6IE9mZgogICAgICAgIEdyYXBoaWNzIFJ1biBM
aXN0IENvbnRyb2xsZXIgTGlnaHQgU2xlZXA6IE9mZgogICAgICAgIEdyYXBoaWNzIDNEIENvYXJz
ZSBHcmFpbiBDbG9jayBHYXRpbmc6IE9mZgogICAgICAgIEdyYXBoaWNzIDNEIENvYXJzZSBHcmFp
biBtZW1vcnkgTGlnaHQgU2xlZXA6IE9mZgogICAgICAgIE1lbW9yeSBDb250cm9sbGVyIExpZ2h0
IFNsZWVwOiBPbgogICAgICAgIE1lbW9yeSBDb250cm9sbGVyIE1lZGl1bSBHcmFpbiBDbG9jayBH
YXRpbmc6IE9uCiAgICAgICAgU3lzdGVtIERpcmVjdCBNZW1vcnkgQWNjZXNzIExpZ2h0IFNsZWVw
OiBPZmYKICAgICAgICBTeXN0ZW0gRGlyZWN0IE1lbW9yeSBBY2Nlc3MgTWVkaXVtIEdyYWluIENs
b2NrIEdhdGluZzogT24KICAgICAgICBCdXMgSW50ZXJmYWNlIE1lZGl1bSBHcmFpbiBDbG9jayBH
YXRpbmc6IE9mZgogICAgICAgIEJ1cyBJbnRlcmZhY2UgTGlnaHQgU2xlZXA6IE9mZgogICAgICAg
IFVuaWZpZWQgVmlkZW8gRGVjb2RlciBNZWRpdW0gR3JhaW4gQ2xvY2sgR2F0aW5nOiBPbgogICAg
ICAgIFZpZGVvIENvbXByZXNzaW9uIEVuZ2luZSBNZWRpdW0gR3JhaW4gQ2xvY2sgR2F0aW5nOiBP
bgogICAgICAgIEhvc3QgRGF0YSBQYXRoIExpZ2h0IFNsZWVwOiBPZmYKICAgICAgICBIb3N0IERh
dGEgUGF0aCBNZWRpdW0gR3JhaW4gQ2xvY2sgR2F0aW5nOiBPbgogICAgICAgIERpZ2l0YWwgUmln
aHQgTWFuYWdlbWVudCBNZWRpdW0gR3JhaW4gQ2xvY2sgR2F0aW5nOiBPZmYKICAgICAgICBEaWdp
dGFsIFJpZ2h0IE1hbmFnZW1lbnQgTGlnaHQgU2xlZXA6IE9mZgogICAgICAgIFJvbSBNZWRpdW0g
R3JhaW4gQ2xvY2sgR2F0aW5nOiBPZmYKICAgICAgICBEYXRhIEZhYnJpYyBNZWRpdW0gR3JhaW4g
Q2xvY2sgR2F0aW5nOiBPZmYKICAgICAgICBBZGRyZXNzIFRyYW5zbGF0aW9uIEh1YiBNZWRpdW0g
R3JhaW4gQ2xvY2sgR2F0aW5nOiBPZmYKICAgICAgICBBZGRyZXNzIFRyYW5zbGF0aW9uIEh1YiBM
aWdodCBTbGVlcDogT2ZmCgpHRlggQ2xvY2tzIGFuZCBQb3dlcjoKICAgICAgICAzMDAgTUh6IChN
Q0xLKQogICAgICAgIDIxNCBNSHogKFNDTEspCiAgICAgICAgMzg3IE1IeiAoUFNUQVRFX1NDTEsp
CiAgICAgICAgNjI1IE1IeiAoUFNUQVRFX01DTEspCiAgICAgICAgNzc1IG1WIChWRERHRlgpCiAg
ICAgICAgNy4yNTQgVyAoYXZlcmFnZSBHUFUpCgpHUFUgVGVtcGVyYXR1cmU6IDM0IEMKR1BVIExv
YWQ6IDAgJQpNRU0gTG9hZDogNiAlCgpVVkQ6IERpc2FibGVkCgpWQ0U6IERpc2FibGVkCi0tLS0K
CkknbSBub3QgcmVhbGx5IHN1cmUgd2hhdCB0byB0cnkgbmV4dC4gSSB1bmZvcnR1bmF0ZWx5IGRv
bid0IGhhdmUKYWNjZXNzIHRvIGFueSBvdGhlciBjYXJkIG9yIGFueSBvdGhlciBtb3RoZXJib2Fy
ZCBJIGNvdWxkIHVzZSB0byB0ZXN0CjovCihPciBhbnl0aGluZyBmYW5jeSBsaWtlIHBjaWUgYnVz
IGFuYWx5emVyIG9yIHN0dWZmIGxpa2UgdGhhdCkuCgpNeSB1bmRlcnN0YW5kaW5nIG9mIHRoZSBm
aXJzdCBlcnJvciBtZXNzYWdlIHRoYXQgc2hvd3MgdXAgaXMgdGhhdCB0aGUKY2FyZCBpdHNlbGYg
dHJpZXMgdG8gbWFrZSBhbiBhY2Nlc3MgdG8gYSBtZW1vcnkgem9uZSBpdCdzIG5vdCBhbGxvd2Vk
CnRvIHJpZ2h0ID8KWyAgMTQ0LjMxMTcwNF0gYW1kZ3B1IDAwMDA6MDY6MDAuMDogQU1ELVZpOiBF
dmVudCBsb2dnZWQKW0lPX1BBR0VfRkFVTFQgZG9tYWluPTB4MDAwMCBhZGRyZXNzPTB4YTA3NjAx
MDEwMCBmbGFncz0weDAwMTBdCgpDaGVlcnMsCgogICAgU3lsdmFpbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
