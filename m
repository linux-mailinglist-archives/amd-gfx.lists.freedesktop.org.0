Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04EB34924
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 15:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DB98987A;
	Tue,  4 Jun 2019 13:42:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D305897E3
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 13:10:12 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f9so1039147wre.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Jun 2019 06:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=XTjql2C5v4M8uYOPRixz2TWxWDx9paXSnM6oeZ5ZkZU=;
 b=ZKGLYqiUZxP9HS3P6ls6OXqGBGPMo50LEF7Zh2riylyvxfBgqcTtM0w5icnWGXlzBB
 x4JfkDngaQSmgRAuTLWyX3X9DK3K9p/XC94JtnEiliPoqpAoYlBt6UPOXnNQLZ9dASud
 lRBefG0oaOtQA1OLUx/helADOd3ftydqboJ2uET9Hu2Gza6z1BNkXj8A1vvSG/13LXtl
 z5GEmc5jEX2b6RvQh7D78+4AWcLkXPdFYkvZtsoJ3co2IG6Sv1QofKT1DwAFW1fmPIDG
 w1FIk3SJG2tNhREIh/eXDOV6iq/ow3Fp1CSdwIkfXFal6z0iBbDvnhUl4dZmtxGUGHsF
 mOzA==
X-Gm-Message-State: APjAAAWHogt8N9hp+CJJA9o9r55kqVj6kiIYcMs63a+zw54sehOsqPrp
 qjwC7XrYEkfy5rudTml16sc=
X-Google-Smtp-Source: APXvYqzQpfJCfCReijfzhbn8Q5gtqH70QiBjRZyTO2piYWpwPggoQQPCsGMAbiUTBu2TLzWp4eWmaw==
X-Received: by 2002:adf:a749:: with SMTP id e9mr20838665wrd.64.1559653810592; 
 Tue, 04 Jun 2019 06:10:10 -0700 (PDT)
Received: from ?IPv6:2a02:c441:bb8:1:a9e6:29b4:50e5:a10e?
 ([2a02:c441:bb8:1:a9e6:29b4:50e5:a10e])
 by smtp.gmail.com with ESMTPSA id x3sm8917843wrp.78.2019.06.04.06.10.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 06:10:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: RX 580 and 5K displays, bandwidth validation failed whith
 multiple monitors
From: =?utf-8?Q?Ga=C3=ABl_HERMET?= <linuzel@gmail.com>
In-Reply-To: <c1f8b7b0-ad49-81cb-a304-ba7193913cc8@amd.com>
Date: Tue, 4 Jun 2019 15:10:09 +0200
Message-Id: <93EF4AF6-391C-4105-99F8-10830B8D3435@gmail.com>
References: <1558969130.2.0@gmail.com>
 <c1f8b7b0-ad49-81cb-a304-ba7193913cc8@amd.com>
To: Harry Wentland <hwentlan@amd.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Tue, 04 Jun 2019 13:42:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=XTjql2C5v4M8uYOPRixz2TWxWDx9paXSnM6oeZ5ZkZU=;
 b=rc3I8lJ2Wqu7WBq0BjcJbPnNeSbgnIc+FNbfZyX3eygVf+V1ep2edys3oSrlh3uTRh
 K8RkrKY6rEzWLApCTOWUmKGAsNO3W3wYMW0HbqL2wb6wdKuwUxv1eJMXX+/zRBOWT7nw
 KB1oY54CjwFjRV1+wWUOnKGvqnKvICHXKY1k1dEgrpEOXrprunl0mro1b4xKnEo3soaN
 vDxQLYD3c63cknPmAwOwhuzY4CZe7RzGBb43ZK0NPHwJLX2FsQcFu85Zd4kf3rMIbHFp
 WWtq4FARI39oZfN6WIq7xT0hmmeZ0N/FNIG9KgnJeOXbY0f2HuIJDld7TkpxQBT9V5WC
 vIKQ==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TGUgMzAgbWFpIDIwMTkgw6AgMTg6MDEsIEhhcnJ5IFdlbnRsYW5kIDxod2VudGxhbkBhbWQuY29t
PiBhIMOpY3JpdCA6Cj4gCj4gT24gMjAxOS0wNS0yNyAxMDo1OCBhLm0uLCBHYcOrbCBIRVJNRVQg
d3JvdGU6Cj4+IEhpLAo+PiAKPj4gSSBoYXZlIGJlZW4gZmFjaW5nIGFuIGlzc3VlIHdpdGggbXkg
NUsgZGlzcGxheSAoaWl5YW1hIFByb0xpdGUKPj4gWEIyNzc5UVFTLVMxKS4KPj4gCj4+IEl0IHdv
cmtzIGZpbmUgYXMgbG9uZyBhcyBpdCBpcyB0aGUgb25seSBhY3RpdmUgbW9uaXRvciwgYXMgc29v
biBhcyBJCj4+IGFjdGl2YXRlIGFub3RoZXIgbW9uaXRvciB0aGUgbWFpbiBvbmUgKDVrKSBjYW4n
dCBkaXNwbGF5IG1vcmUgdGhhbiA0ay4KPj4gCj4+IERlYnVnIHVzaW5nICJlY2hvIDB4NCA+IC9z
eXMvbW9kdWxlL2RybS9wYXJhbWV0ZXJzL2RlYnVnIiBzaG93IHRoaXMgOgo+PiBtYWkgMjMgMDk6
MDE6MjIgYnVyZWF1LWdhZWwgL3Vzci9saWIvZ2RtMy9nZG0teC1zZXNzaW9uWzM0NjVdOiAoRUUp
Cj4+IEFNREdQVSgwKTogZmFpbGVkIHRvIHNldCBtb2RlOiBJbnZhbGlkIGFyZ3VtZW50Cj4+IG1h
aSAyMyAwOTowMToyMiBidXJlYXUtZ2FlbCBrZXJuZWw6IFtkcm06ZGNlMTEyX3ZhbGlkYXRlX2Jh
bmR3aWR0aAo+PiBbYW1kZ3B1XV0gZGNlMTEyX3ZhbGlkYXRlX2JhbmR3aWR0aDogQmFuZHdpZHRo
IHZhbGlkYXRpb24gZmFpbGVkIQo+PiAKPj4gSSBkaXNhYmxlZCB0aGUgY2hlY2sgYnkgZm9yY2lu
ZyBpc19kaXNwbGF5X2NvbmZpZ3VyYXRpb25fc3VwcG9ydGVkIHRvCj4+IHJldHVybiB0cnVlIGlu
IGRjZV9jYWxjcy5jIGFuZCBpdCB3b3JrcyBmaW5lLgo+PiAKPj4gQW55dGhpbmcgSSBjYW4gZG8g
dG8gY29ycmVjdCB0aGlzIGJhbmR3aWR0aCBjYWxjdWxhdGlvbiA/Cj4+IAo+IAo+IFRoZSBiYW5k
d2lkdGggZm9ybXVsYXMgY29tZSBmcm9tIG91ciBIVyB0ZWFtcyBhbmQgdXN1YWxseSBsZWF2ZSBh
IGdvb2QKPiBtYXJnaW4gb2YgZXJyb3IuIENoYW5naW5nIHRoZSBmb3JtdWxhcyB0byBhbGxvdyBm
b3IgeW91ciBjYXNlIGlzbid0IGEKPiBjb3JyZWN0aW9uIGFzIGl0IG1pZ2h0IGNhdXNlIGlzc3Vl
cyBpbiBjZXJ0YWluIHNjZW5hcmlvdXMsIGkuZS4gdGhlcmUncwo+IG5vIG1vcmUgZ3VhcmFudGVl
IHRoYXQgdGhpbmdzIHdvcmsgYXMgZXhwZWN0ZWQuCj4gCj4gRXhhbXBsZXMgYXJlIDRrIHZpZGVv
IHBsYXliYWNrIChlc3BlY2lhbGx5IG11bHRpcGxlIHZpZGVvcyksIGdhbWluZy4KPiBBbnl0aGlu
ZyB0aGF0IGRvZXMgYSBsb3Qgb2YgR1BVIG1lbW9yeSBhY2Nlc3MuCj4gCj4gSXNzdWVzIHRoYXQg
bWlnaHQgYXBwZWFyIGFyZSB1bmRlcmZsb3csIGkuZS4gd2hpdGUgbGluZXMgb24gdGhlIHNjcmVl
bi4KPiBJbiBleHRyZW1lIGNhc2VzIHVuZGVyZmxvdyBtaWdodCBldmVuIGhhbmcgdGhlIGVudGly
ZSBkaXNwbGF5IHBpcGUuCj4gCj4gSGFycnkKCk9rIEkgdW5kZXJzdGFuZC4KCklzIHRoZXJlIGFu
eSByZWFzb24gd2h5IGl0IHdvcmtzIHdpdGhvdXQgYW55IHRyb3VibGUgb3Igc2V0dGluZyB0byBt
ZXNzIHdpdGggaW4gYm90aCBXaW5kb3dzIGFuZCBNYWNPUyA/CgpUaGlzIHNldHVwIGlzIG5vdCB0
aGF0IHJhcmUsIDVrIGlNYWNzIHdpdGggUmFkZW9uIGdyYXBoaWNzIGhhdmUgZXhpc3RlZCBmb3Ig
eWVhcnMgbm93IGFuZCB0aGV5IGFsbCBzdXBwb3J0IGV4dGVybmFsIGRpc3BsYXlzIGZpbmUuCgpU
aGFua3MgYWdhaW4sCkdhw6tsLgoKPiAKPj4gCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
