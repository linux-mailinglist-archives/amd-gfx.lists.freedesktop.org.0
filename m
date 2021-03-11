Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F27E337531
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Mar 2021 15:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7C96ECFF;
	Thu, 11 Mar 2021 14:13:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E6526ECFF
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Mar 2021 14:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id CF7072A6045;
 Thu, 11 Mar 2021 15:13:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id QlP-Wwc2coHB; Thu, 11 Mar 2021 15:13:49 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 399992A6016;
 Thu, 11 Mar 2021 15:13:49 +0100 (CET)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1lKM4S-0004W9-GH; Thu, 11 Mar 2021 15:13:48 +0100
To: Simon Ser <contact@emersion.fr>
References: <20210310145019.2877-1-contact@emersion.fr>
 <a4fe57bf-33f2-43f5-0170-2135c6a919df@daenzer.net>
 <mg9Sasg2hDaWhKchS7MJOG1GxFgyK7EjamocMRigAuCcwDNJhI5DGVLItXCxyKqNkEl8E2kgsnijtkSMI_YMTe8_Rjmn0Sh8PB32YNTfH1c=@emersion.fr>
 <07f53c21-920d-7494-8195-c678216610a4@daenzer.net>
 <OlOrZse4H1w18QcjDxxswj-tCs1GMJuhZ0S0hYTrcTkXEO-OjALqKgi1vc8hb46TvH9-J3Ri39_qsRHoevbiHgv88dQx8fcWUPKIRrH19KQ=@emersion.fr>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v2 0/5] amd/display: improve atomic cursor checks
Message-ID: <49db6786-6edc-efb8-45db-80895b55ea90@daenzer.net>
Date: Thu, 11 Mar 2021 15:13:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <OlOrZse4H1w18QcjDxxswj-tCs1GMJuhZ0S0hYTrcTkXEO-OjALqKgi1vc8hb46TvH9-J3Ri39_qsRHoevbiHgv88dQx8fcWUPKIRrH19KQ=@emersion.fr>
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

T24gMjAyMS0wMy0xMSAxOjEwIHAubS4sIFNpbW9uIFNlciB3cm90ZToKPiBPbiBUaHVyc2RheSwg
TWFyY2ggMTF0aCwgMjAyMSBhdCAxMDowNSBBTSwgTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVu
emVyLm5ldD4gd3JvdGU6Cj4gCj4+IE9uIDIwMjEtMDMtMTEgOTo1NyBhLm0uLCBTaW1vbiBTZXIg
d3JvdGU6Cj4+PiBPbiBXZWRuZXNkYXksIE1hcmNoIDEwdGgsIDIwMjEgYXQgNjoyMCBQTSwgTWlj
aGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4gd3JvdGU6Cj4+Pj4gT24gMjAyMS0wMy0x
MCAzOjUwIHAubS4sIFNpbW9uIFNlciB3cm90ZToKPj4+Pgo+Pj4+PiBDaGFuZ2VzIGluIHYyOiBk
cm9wICJhbWQvZGlzcGxheTogZmFpbCBvbiBjdXJzb3IgcGxhbmUgd2l0aG91dCBhbgo+Pj4+PiB1
bmRlcmx5aW5nIHBsYW5lIi4gVGhpcyByZXRhaW5zIHRoZSBjdXJyZW50IGJlaGF2aW9yIGluc3Rl
YWQuCj4+Pj4KPj4+PiBQYXRjaGVzIDIgJiAzIChhbmQgcG9zc2libHkgND8gbm90IHN1cmUpIHdv
dWxkIHN0aWxsIGNhdXNlIHRoZSBzYW1lCj4+Pj4gaXNzdWUgaW4gdGhlIHNjZW5hcmlvIGRpc2N1
c3NlZCBpbiBmb2xsb3ctdXBzIHRvIHRoZSBkcm9wcGVkIHBhdGNoCj4+Pj4gKGRpc2FibGluZyBh
biBBUkdCIG92ZXJsYXkgcGxhbmUgd2l0aCBhIFlVViBwcmltYXJ5IHBsYW5lIGFuZCB0aGUKPj4+
PiBjdXJzb3IgcGxhbmUgZW5hYmxlZCksIHdvdWxkbid0IHRoZXk/Cj4+Pgo+Pj4gWWVzLCBidXQg
dGhhdCBzaG91bGRuJ3QgYmUgdG9vIG11Y2ggb2YgYW4gaXNzdWUgaW4gcHJhY3RpY2UsIHNpbmNl
Cj4+PiB1c2VyLXNwYWNlIHVzaW5nIFlVViBhbmQgb3ZlcmxheXMgYWxzbyB1c2VzIGF0b21pYy4g
RHJvcHBpbmcgdGhlIHBhdGNoCj4+PiBhdm9pZHMgdGhlIGlzc3VlIHRvIGJlIHRyaWdnZXJlZCB3
aXRoIGxlZ2FjeSB1c2VyLXNwYWNlLgo+Pgo+PiBUaGUgbGFzdCBzY2VuYXJpbyBkaXNjdXNzZWQg
aXMgYWJvdXQgYXRvbWljIEtNUyB1c2VyIHNwYWNlIHRyeWluZyB0byBkaXNhYmxlCj4+IHRoZSBv
dmVybGF5IHBsYW5lLiBEYW5pZWwgc2VlbXMgdG8gYWdyZWUgdGhhdCBub3QgYmVpbmcgYWJsZSB0
byBkaXNhYmxlIGFuCj4+IG92ZXJsYXkgcGxhbmUgaXMgdG9vIHN1cnByaXNpbmcuCj4gCj4gV2Vs
bCwgYW1kZ3B1IGNhbiBhbHJlYWR5IHJldHVybiBhIGZhaWx1cmUgaWYgdXNlci1zcGFjZSB0cmll
cyB0byBkaXNhYmxlIHRoZQo+IG92ZXJsYXk6Cj4gCj4gLSBVc2VyLXNwYWNlIHNldHMgdXAgdGhl
IHByaW1hcnkgcGxhbmUgd2l0aCBhIHNjYWxlZCBGQi4KPiAtIFVzZXItc3BhY2UgZW5hYmxlcyB0
aGUgb3ZlcmxheSBhbmQgY3Vyc29yIHBsYW5lcyB3aXRob3V0IHNjYWxpbmcuCj4gLSBVc2VyLXNw
YWNlIHRyaWVzIHRvIGRpc2FibGUgdGhlIG92ZXJsYXksIGtlcm5lbCByZXR1cm5zIGEgZmFpbHVy
ZSBiZWNhdXNlIGEKPiAgIG5vbi1zY2FsZWQgY3Vyc29yIGlzIGluY29tcGF0aWJsZSB3aXRoIGEg
c2NhbGVkIHVuZGVybHlpbmcgcGxhbmUuCj4gCj4gU28gdGhpcyBzZXJpZXMganVzdCBhZGRzIGEg
bmV3IGVycm9yIGNvbmRpdGlvbi4KClRoaXMgaXMgd2h5IEkgd3JvdGUgIkhvdXN0b24sIHdlIGhh
dmUgYSBwcm9ibGVtIi4gSSBvbmx5IHJlYWxpemVkIGF0IHRoYXQgcG9pbnQgdGhhdCB3ZSd2ZSBw
YWludGVkIG91cnNlbHZlcyBpbnRvIGFuIHVuY29tZm9ydGFibGUgY29ybmVyLgoKCj4gSSdtIG5v
dCBhIGZhbiBvZiBhZGRpbmcga2VybmVsIGhhY2tzIGxpa2Ugc2V0dGluZyB1cCBhIHRyYW5zcGFy
ZW50IEZCLCB3aGVuCj4gdXNlci1zcGFjZSBjYW4ganVzdCBhdm9pZCB0aGUgZmFpbHVyZSB3aXRo
IGF0b21pYyB0ZXN0LW9ubHkgY29tbWl0cyAoYW5kIGUuZy4KPiB1c2UgdGhlIG92ZXJsYXkgdG8g
ZGlzcGxheSB0aGUgY3Vyc29yIGltYWdlIGluc3RlYWQgb2YgdGhlIGN1cnNvciBwbGFuZSkuCgpJ
J20gbm90IGEgZmFuIG9mIHJlcXVpcmluZyBlYWNoIGF0b21pYyBjbGllbnQgdG8gaGFuZGxlIHRo
aXMgY29tcGxleGl0eS4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAg
ICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRo
dXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
