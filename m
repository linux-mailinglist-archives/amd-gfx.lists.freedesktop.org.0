Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C42A10878
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jan 2025 15:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE3D10E320;
	Tue, 14 Jan 2025 14:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="h7j3+xyn";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D0B10E270
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jan 2025 12:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1736857638; x=1737116838;
 bh=89nLY5/YLpIAnsPf7Xi39uC+cwWlc9rhJv4yAfyvK9I=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=h7j3+xynb/ZT9SCLmYOwTfivS9v+ZSBZErIWQy6m2S+t/uGrY4/ZY8AyVVC5xINnL
 OoPCqXlOYD0H7q7F38qvmeDVQxLqRZ1Kpx1K1lIoJOY1SYTjchrdW66PunlSuVTRXi
 VSWd1ZDgfcZCU/Okx6OkK8EoWhUXw7ql548e3/opg2RXlD16EIqdu5ppJQ65aKK6C2
 /ZstZpycY7xR517XrrNHcNwFQ+SGKqkuvcxZP8hzOAd/O3kkVBquuaOwvyLgYAW53N
 7D97tibhGl4IKWFh/wU7T/6K57SU5fwe+kEOGqn4PCnd+tjJQcQ5SKinc6jxGvsLCV
 ghJbtWgpTiKVw==
Date: Tue, 14 Jan 2025 12:27:12 +0000
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
From: SyntheticBird <syntheticbirdxmr@protonmail.com>
Subject: drm/amdgpu: AMDGPU unusable since 6.12.1 and it looks like no one
 cares.
Message-ID: <o93Aruut7VI05oqVX7Se1udr5FAyqfyP_TGDutW0p2fXBSkRv7QkhpLmAT-buTpdWIwn8PnC8B2DNSMtaTp5kk00ZtK653PDLuK14uoUI4k=@protonmail.com>
Feedback-ID: 130782727:user:proton
X-Pm-Message-ID: f5e884eba7f134e1ac73d2cd590630965e5dde9a
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1=_ViVqgM5ZdfYW6XtX0K2SO6R3pge1xBhx33kcxOHLM"
X-Mailman-Approved-At: Tue, 14 Jan 2025 14:05:05 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--b1=_ViVqgM5ZdfYW6XtX0K2SO6R3pge1xBhx33kcxOHLM
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGVsbG8gYW5kIGhhcHB5IG5ldyB5ZWFyIHRvIGFsbCBtZW1iZXJzIG9mIHRoaXMgbGlzdC4KCkkg
a25vdyB0aGF0IG1haWxpbmcgbGlzdHMgYXJlbid0IG1lYW50IGZvciBiZWdnaW5nIGZvciBzdXBw
b3J0LCBidXQgYWZ0ZXIgZGlzY3Vzc2luZyB0aGlzIGluIGFub3RoZXIgZGlzdHJpYnV0aW9uIGNo
YW5uZWwsIGl0IHNlZW1zIHRvIG1lIGxpa2UgaXQgaXMgdGhlIG9ubHkgd2F5IGZvciBtZSBhbmQg
b3RoZXIgdXNlcnMgdG8gZ3JhYiB0aGUgYXR0ZW50aW9uIG9mIGEgbWFpbnRhaW5lci4KClNpbmNl
IDYuMTIuMSwgc2V2ZXJhbCB1c2VycyBoYXZlIHJlcG9ydGVkIGEga2VybmVsIGZyZWV6ZSBpc3N1
ZSB3aXRoIEFNREdQVSwgaW5jbHVkaW5nIGEgY29tcGxldGUgc3RhY2sgdHJhY2UuIEl0IGNvcnJl
c3BvbmRzIHRvIHRoZSBmb2xsb3dpbmcgaXNzdWVzIG9uIEdpdExhYjoKCmh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzM3ODdodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy8zODY2CgpJIGFsc28gc3VzcGVjdCB0aGlzIGlz
c3VlIG1heSBoYXZlIGhhcHBlbmVkIHRvIG9uZSB1c2VyIG9uIHRoZSBMZXZlbDFUZWNoIGZvcnVt
OiBodHRwczovL2ZvcnVtLmxldmVsMXRlY2hzLmNvbS90L2hlbHAtd2l0aC10cm91Ymxlc2hvb3Rp
bmctZnJlZXppbmctd2l0aC1saW51eC1rZXJuZWwtNi0xMi1vbi1hcmNoLzIyMTM0MC8yMgoKVHdv
IG1vbnRocyBoYXZlIHBhc3NlZCBzaW5jZSB0aGUgZmlyc3QgcmVwb3J0IG9mIHRoaXMgYnVnLCBh
bmQgbm8gb25lIGluIGVpdGhlciBvZiB0aGUgdHdvIGlzc3VlcyBoYXMgZXZlciByZWFjaGVkIG91
dCB0byB1cy4gSSd2ZSBjaGVja2VkIHRoZSBtYWlsaW5nIGxpc3QgYXJjaGl2ZSwgYW5kIGl0IHNl
ZW1zIGxpa2Ugbm8gbWFpbnRhaW5lciBoYXMgZXZlciBkaXNjdXNzZWQgaXQuIFdlJ3JlIHNpbXBs
eSBsZWZ0IGFsb25lIHdpdGggb25seSBob3BlLgoKSSBwZXJmZWN0bHkgdW5kZXJzdGFuZCB0aGF0
IG1haW50YWluZXJzIGFyZSBidXN5LCBhbmQgSSBkbyBub3QgYmxhbWUgdGhlbSwgYnV0IHdlIGFz
IHVzZXJzIGFuZCBvd25lcnMgb2YgQU1ER1BVIGhhdmUgbm8gb3RoZXIgY2hvaWNlIGJ1dCB0byB0
cnkgcmVhY2hpbmcgb3V0IHRvIHlvdSwgdG8gYXQgbGVhc3QgYmUgc3VyZSB0aGF0IHRoaXMgaXNz
dWUgaGFzbid0IGJlZW4gaWdub3JlZCBpbiB0aGUgZGVwdGhzIG9mIHRoZSBHaXRMYWIgaXNzdWUg
bGlzdC4KClRoaXMgaXNzdWUgaXMgaW1wYWN0aW5nIHZlcnNpb25zIDYuMTIuMSB0byB0aGUgbGF0
ZXN0IDYuMTMgcmMuIFNldmVyYWwgdXNlcnMgYXJlIHN0aWxsIHN0dWNrIG9uIGVpdGhlciA2LjYg
TFRTIG9yIDYuMTEuOS0xMC4gRm9yIHVzZXJzIHJlbHlpbmcgb24gZmVhdHVyZXMgdGhhdCBoYXZl
IGJlZW4gaW50cm9kdWNlZCBiZXR3ZWVuIDYuNiBhbmQgNi4xMiwgdGhleSBjYW5ub3QgZG93bmdy
YWRlIHRvIDYuNiBhbmQgYWxzbyBjYW5ub3QgdXBncmFkZSB0byA2LjEyLCBsZWF2aW5nIHRoZW0g
d2l0aG91dCB2dWxuZXJhYmlsaXRpZXMgYmVpbmcgcGF0Y2hlZCBvbiBtYWlubGluZSBhbmQgTFRT
LgoKQnkgdGhpcyBlbWFpbCwgSSdtIHJlcXVlc3RpbmcgdGhhdCBhdCBsZWFzdCBhIG1haW50YWlu
ZXIgb3IgY29udHJpYnV0b3IgaGVscCB1cyBvdXQsIG9yIGF0IGxlYXN0IGFzc2VzcyB0aGUgaXNz
dWUgYW5kIG5vdCBsZXQgaXQgcm90LgoKU2luY2VyZWx5LCBTeW50aGV0aWNCaXJk

--b1=_ViVqgM5ZdfYW6XtX0K2SO6R3pge1xBhx33kcxOHLM
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij48L2Rpdj48cD5IZWxsbyBhbmQgaGFwcHkgbmV3IHllYXIgdG8gYWxsIG1lbWJlcnMgb2Yg
dGhpcyBsaXN0LjwvcD48cD5JIGtub3cgdGhhdCBtYWlsaW5nIGxpc3RzIGFyZW4ndCBtZWFudCBm
b3IgYmVnZ2luZyBmb3Igc3VwcG9ydCwgYnV0IGFmdGVyIGRpc2N1c3NpbmcgdGhpcyBpbiBhbm90
aGVyIGRpc3RyaWJ1dGlvbiBjaGFubmVsLCBpdCBzZWVtcyB0byBtZSBsaWtlIGl0IGlzIHRoZSBv
bmx5IHdheSBmb3IgbWUgYW5kIG90aGVyIHVzZXJzIHRvIGdyYWIgdGhlIGF0dGVudGlvbiBvZiBh
IG1haW50YWluZXIuPC9wPjxwPlNpbmNlIDYuMTIuMSwgc2V2ZXJhbCB1c2VycyBoYXZlIHJlcG9y
dGVkIGEga2VybmVsIGZyZWV6ZSBpc3N1ZSB3aXRoIEFNREdQVSwgaW5jbHVkaW5nIGEgY29tcGxl
dGUgc3RhY2sgdHJhY2UuIEl0IGNvcnJlc3BvbmRzIHRvIHRoZSBmb2xsb3dpbmcgaXNzdWVzIG9u
IEdpdExhYjo8L3A+PHA+PGEgcmVsPSJub29wZW5lciIgdGFyZ2V0PSJfYmxhbmsiIGhyZWY9Imh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzM3ODciPmh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzM3ODc8L2E+PGEgcmVs
PSJub29wZW5lciIgdGFyZ2V0PSJfYmxhbmsiIGhyZWY9Imh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzM4NjYiPmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9kcm0vYW1kLy0vaXNzdWVzLzM4NjY8L2E+PC9wPjxwPkkgYWxzbyBzdXNwZWN0IHRoaXMg
aXNzdWUgbWF5IGhhdmUgaGFwcGVuZWQgdG8gb25lIHVzZXIgb24gdGhlIExldmVsMVRlY2ggZm9y
dW06IDxhIHJlbD0ibm9vcGVuZXIiIHRhcmdldD0iX2JsYW5rIiBocmVmPSJodHRwczovL2ZvcnVt
LmxldmVsMXRlY2hzLmNvbS90L2hlbHAtd2l0aC10cm91Ymxlc2hvb3RpbmctZnJlZXppbmctd2l0
aC1saW51eC1rZXJuZWwtNi0xMi1vbi1hcmNoLzIyMTM0MC8yMiI+aHR0cHM6Ly9mb3J1bS5sZXZl
bDF0ZWNocy5jb20vdC9oZWxwLXdpdGgtdHJvdWJsZXNob290aW5nLWZyZWV6aW5nLXdpdGgtbGlu
dXgta2VybmVsLTYtMTItb24tYXJjaC8yMjEzNDAvMjI8L2E+PC9wPjxwPlR3byBtb250aHMgaGF2
ZSBwYXNzZWQgc2luY2UgdGhlIGZpcnN0IHJlcG9ydCBvZiB0aGlzIGJ1ZywgYW5kIG5vIG9uZSBp
biBlaXRoZXIgb2YgdGhlIHR3byBpc3N1ZXMgaGFzIGV2ZXIgcmVhY2hlZCBvdXQgdG8gdXMuIEkn
dmUgY2hlY2tlZCB0aGUgbWFpbGluZyBsaXN0IGFyY2hpdmUsIGFuZCBpdCBzZWVtcyBsaWtlIG5v
IG1haW50YWluZXIgaGFzIGV2ZXIgZGlzY3Vzc2VkIGl0LiBXZSdyZSBzaW1wbHkgbGVmdCBhbG9u
ZSB3aXRoIG9ubHkgaG9wZS48L3A+PHA+SSBwZXJmZWN0bHkgdW5kZXJzdGFuZCB0aGF0IG1haW50
YWluZXJzIGFyZSBidXN5LCBhbmQgSSBkbyBub3QgYmxhbWUgdGhlbSwgYnV0IHdlIGFzIHVzZXJz
IGFuZCBvd25lcnMgb2YgQU1ER1BVIGhhdmUgbm8gb3RoZXIgY2hvaWNlIGJ1dCB0byB0cnkgcmVh
Y2hpbmcgb3V0IHRvIHlvdSwgdG8gYXQgbGVhc3QgYmUgc3VyZSB0aGF0IHRoaXMgaXNzdWUgaGFz
bid0IGJlZW4gaWdub3JlZCBpbiB0aGUgZGVwdGhzIG9mIHRoZSBHaXRMYWIgaXNzdWUgbGlzdC48
L3A+PHA+VGhpcyBpc3N1ZSBpcyBpbXBhY3RpbmcgdmVyc2lvbnMgNi4xMi4xIHRvIHRoZSBsYXRl
c3QgNi4xMyByYy4NClNldmVyYWwgdXNlcnMgYXJlIHN0aWxsIHN0dWNrIG9uIGVpdGhlciA2LjYg
TFRTIG9yIDYuMTEuOS0xMC4gRm9yIHVzZXJzIHJlbHlpbmcgb24gZmVhdHVyZXMgdGhhdCBoYXZl
IGJlZW4gaW50cm9kdWNlZCBiZXR3ZWVuIDYuNiBhbmQgNi4xMiwgdGhleSBjYW5ub3QgZG93bmdy
YWRlIHRvIDYuNiBhbmQgYWxzbyBjYW5ub3QgdXBncmFkZSB0byA2LjEyLCBsZWF2aW5nIHRoZW0g
d2l0aG91dCB2dWxuZXJhYmlsaXRpZXMgYmVpbmcgcGF0Y2hlZCBvbiBtYWlubGluZSBhbmQgTFRT
LjwvcD48cD5CeSB0aGlzIGVtYWlsLCBJJ20gcmVxdWVzdGluZyB0aGF0IGF0IGxlYXN0IGEgbWFp
bnRhaW5lciBvciBjb250cmlidXRvciBoZWxwIHVzIG91dCwgb3IgYXQgbGVhc3QgYXNzZXNzIHRo
ZSBpc3N1ZSBhbmQgbm90IGxldCBpdCByb3QuPC9wPjxwPlNpbmNlcmVseSwNClN5bnRoZXRpY0Jp
cmQ8L3A+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNp
emU6IDE0cHg7Ij48YnI+PC9kaXY+DQo8ZGl2IGNsYXNzPSJwcm90b25tYWlsX3NpZ25hdHVyZV9i
bG9jayBwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay1lbXB0eSIgc3R5bGU9ImZvbnQtZmFtaWx5
OiBBcmlhbCwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxNHB4OyI+DQogICAgPGRpdiBjbGFzcz0i
cHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2stdXNlciBwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9j
ay1lbXB0eSI+PC9kaXY+DQogICAgDQogICAgICAgICAgICA8ZGl2IGNsYXNzPSJwcm90b25tYWls
X3NpZ25hdHVyZV9ibG9jay1wcm90b24gcHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2stZW1wdHki
Pg0KICAgICAgICANCiAgICAgICAgICAgIDwvZGl2Pg0KPC9kaXY+DQo=


--b1=_ViVqgM5ZdfYW6XtX0K2SO6R3pge1xBhx33kcxOHLM--

