Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF74F33EB91
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Mar 2021 09:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528DF89A34;
	Wed, 17 Mar 2021 08:32:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E8016E4F3
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Mar 2021 08:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 7BB612A6042;
 Wed, 17 Mar 2021 09:32:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id xl3is73tHmZc; Wed, 17 Mar 2021 09:32:48 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 37F6A2A6016;
 Wed, 17 Mar 2021 09:32:48 +0100 (CET)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1lMRbj-001mjR-Jf; Wed, 17 Mar 2021 09:32:47 +0100
To: Simon Ser <contact@emersion.fr>, Daniel Vetter <daniel@ffwll.ch>
References: <20210310145019.2877-1-contact@emersion.fr>
 <a4fe57bf-33f2-43f5-0170-2135c6a919df@daenzer.net>
 <mg9Sasg2hDaWhKchS7MJOG1GxFgyK7EjamocMRigAuCcwDNJhI5DGVLItXCxyKqNkEl8E2kgsnijtkSMI_YMTe8_Rjmn0Sh8PB32YNTfH1c=@emersion.fr>
 <07f53c21-920d-7494-8195-c678216610a4@daenzer.net>
 <OlOrZse4H1w18QcjDxxswj-tCs1GMJuhZ0S0hYTrcTkXEO-OjALqKgi1vc8hb46TvH9-J3Ri39_qsRHoevbiHgv88dQx8fcWUPKIRrH19KQ=@emersion.fr>
 <49db6786-6edc-efb8-45db-80895b55ea90@daenzer.net>
 <gA1HyRXp2aQRPxQEUNKYq1HN64EEpVtJeSsDS0pZEjKlO_gkZWhVKlu7OkjDEFCY9rI52MOV7z0sKUgZ9bomhbHqXr886R9XyH45DX3d8yQ=@emersion.fr>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v2 0/5] amd/display: improve atomic cursor checks
Message-ID: <8440a340-6aaa-20f9-b239-bc3c96d818a2@daenzer.net>
Date: Wed, 17 Mar 2021 09:32:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <gA1HyRXp2aQRPxQEUNKYq1HN64EEpVtJeSsDS0pZEjKlO_gkZWhVKlu7OkjDEFCY9rI52MOV7z0sKUgZ9bomhbHqXr886R9XyH45DX3d8yQ=@emersion.fr>
Content-Language: en-CA
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
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ClsgQWRkaW5nIERhbmllbCBhZ2FpbiBdCgpPbiAyMDIxLTAzLTE3IDk6MjEgYS5tLiwgU2ltb24g
U2VyIHdyb3RlOgo+IE9uIFRodXJzZGF5LCBNYXJjaCAxMXRoLCAyMDIxIGF0IDM6MTMgUE0sIE1p
Y2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+IHdyb3RlOgo+IAo+Pj4gSSdtIG5vdCBh
IGZhbiBvZiBhZGRpbmcga2VybmVsIGhhY2tzIGxpa2Ugc2V0dGluZyB1cCBhIHRyYW5zcGFyZW50
IEZCLCB3aGVuCj4+PiB1c2VyLXNwYWNlIGNhbiBqdXN0IGF2b2lkIHRoZSBmYWlsdXJlIHdpdGgg
YXRvbWljIHRlc3Qtb25seSBjb21taXRzIChhbmQgZS5nLgo+Pj4gdXNlIHRoZSBvdmVybGF5IHRv
IGRpc3BsYXkgdGhlIGN1cnNvciBpbWFnZSBpbnN0ZWFkIG9mIHRoZSBjdXJzb3IgcGxhbmUpLgo+
Pgo+PiBJJ20gbm90IGEgZmFuIG9mIHJlcXVpcmluZyBlYWNoIGF0b21pYyBjbGllbnQgdG8gaGFu
ZGxlIHRoaXMgY29tcGxleGl0eS4KPiAKPiBUaGF0J3MganVzdCBob3cgYXRvbWljIHdvcmtzIHRo
b3VnaC4gVXNlci1zcGFjZSBpcyBleHBlY3RlZCB0byBpbmNyZW1lbnRhbGx5Cj4gYnVpbGQgdGhl
IGF0b21pYyByZXF1ZXN0LCBiYWlsaW5nIG91dCBpZiBzb21ldGhpbmcgZG9lc24ndCB3b3JrIGFs
b25nIHRoZSB3YXkuCgpCZWluZyB1bmFibGUgdG8gZGlzYWJsZSBhIHBsYW5lIHdoaWNoIGlzIGN1
cnJlbnRseSBlbmFibGVkIGlzIHF1aXRlIGRpZmZlcmVudCBmcm9tIGJlaW5nIHVuYWJsZSB0byBl
bmFibGUgYSBwbGFuZSB3aGljaCBpcyBjdXJyZW50bHkgZGlzYWJsZWQuIEhvdyBpcyB1c2VyIHNw
YWNlIHN1cHBvc2VkIHRvIHJlYWN0IHRvIHRoYXQsIG90aGVyIHRoYW4gbWF5YmUgZGlzYWJsaW5n
IGV2ZXJ5dGhpbmcgYW5kIHN0YXJ0aW5nIGZyb20gc2NyYXRjaD8KCgo+IERvaW5nIGl0IHRoZSBv
bGQgd2F5IChpZS4gaXNzdWluZyBzaW5ndWxhciBhdG9taWMgY29tbWl0cywgaWUuIHVzaW5nIHRo
ZSBhdG9taWMKPiBBUEkganVzdCBsaWtlIHRoZSBsZWdhY3kgQVBJIGlzIHVzZWQpIHdvbid0IHdv
cmsgaW4gbWFueSBzaXR1YXRpb25zIGFueXdheXMuCgpUaGlzIGlzbid0IGFib3V0IHRoYXQsIG5v
dCBzdXJlIHdoeSB5b3Uga2VlcCBicmluZ2luZyBpdCB1cC4KCgotLSAKRWFydGhsaW5nIE1pY2hl
bCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNv
bQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVz
YSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
Cg==
