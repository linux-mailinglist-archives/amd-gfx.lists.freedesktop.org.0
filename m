Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1076A2D28D1
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Dec 2020 11:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8727A6E95C;
	Tue,  8 Dec 2020 10:28:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from cstnet.cn (smtp20.cstnet.cn [159.226.251.20])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1620D6E0BF
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Dec 2020 10:28:32 +0000 (UTC)
Received: by ajax-webmail-APP-10 (Coremail) ; Tue, 8 Dec 2020 18:28:27 +0800
 (GMT+08:00)
X-Originating-IP: [159.226.43.53]
Date: Tue, 8 Dec 2020 18:28:27 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Chen Lei" <chenlei18s@ict.ac.cn>
To: christian.koenig@amd.com, alexander.deucher@amd.com
Subject: Re: Re: [PATCH] drm/amdgpu: add the missing
 AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS flag
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20201118(d3a44678)
 Copyright (c) 2002-2020 www.mailtech.cn cnic.cn
In-Reply-To: <a0ee3531-194c-d388-7788-69d59e7421e2@gmail.com>
References: <20201208025040.30268-1-chenlei18s@ict.ac.cn>
 <a0ee3531-194c-d388-7788-69d59e7421e2@gmail.com>
MIME-Version: 1.0
Message-ID: <6502eaf9.1cc77.17641e52d45.Coremail.chenlei18s@ict.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: tACowABH2rBMVc9fCNcBAA--.5256W
X-CM-SenderInfo: hfkh0zthlrm2g6lf3hldfou0/1tbiCgoEBVz4jNHnxwABsZ
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW7Jw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
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

SGkhIEkgYW0gbm90IHF1aXRlIGZhbWlsaWFyIHdpdGggaXQsIGFuZCBJIHdhcyB3b25kZXJpbmcg
d2h5IHRoaXMgZmxhZyBpcyBibG9ja2VkLiBBcyB0aGUgVk0gc3Vic3lzdGVtIHN1cHBvcnRzIGdp
YW50IHBhZ2VzLCBpdCBtaWdodCBiZSB1c2VmdWwgdG8gYWRkIHRoaXMgZmxhZyBpbiBhbWRncHVf
Z2VtX2NyZWF0ZV9pb2N0bC4gCgoKJmd0OyAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCiZndDsg5Y+R
5Lu25Lq6OiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwu
Y29tPgomZ3Q7IOWPkemAgeaXtumXtDogMjAyMC0xMi0wOCAxNTo0MTowMiAo5pif5pyf5LqMKQom
Z3Q7IOaUtuS7tuS6ujogIkNoZW4gTGVpIiA8Y2hlbmxlaTE4c0BpY3QuYWMuY24+LCBhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tLCBjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20KJmd0OyDmioTpgIE6
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCiZndDsg5Li76aKYOiBSZTogW1BBVENIXSBk
cm0vYW1kZ3B1OiBhZGQgdGhlIG1pc3NpbmcgQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DT05USUdV
T1VTIGZsYWcKJmd0OyAKJmd0OyBBbSAwOC4xMi4yMCB1bSAwMzo1MCBzY2hyaWViIENoZW4gTGVp
OgomZ3Q7ICZndDsgQWRkIHRoZSBBTURHUFVfR0VNX0NSRUFURV9WUkFNX0NPTlRJR1VPVVMgZmxh
ZyBpbiBhbWRncHVfZ2VtX2NyZWF0ZV9pb2N0bC4KJmd0OyAmZ3Q7CiZndDsgJmd0OyBTaWduZWQt
b2ZmLWJ5OiBDaGVuIExlaSA8Y2hlbmxlaTE4c0BpY3QuYWMuY24+CiZndDsgCiZndDsgTkFLLCB0
aGF0IGlzIG5vdCBtaXNzaW5nIGJ1dCBpbnRlbnRpb25hbGx5IGJsb2NrZWQuCiZndDsgCiZndDsg
Q2hyaXN0aWFuLgomZ3Q7IAomZ3Q7ICZndDsgLS0tCiZndDsgJmd0OyAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyB8IDEgKwomZ3Q7ICZndDsgICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKJmd0OyAmZ3Q7CiZndDsgJmd0OyBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dlbS5jCiZndDsgJmd0OyBpbmRleCA3ZTgyNjVkYTkuLmRhMThhZWZmNyAx
MDA2NDQKJmd0OyAmZ3Q7IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
ZW0uYwomZ3Q7ICZndDsgKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dl
bS5jCiZndDsgJmd0OyBAQCAtMjMzLDYgKzIzMyw3IEBAIGludCBhbWRncHVfZ2VtX2NyZWF0ZV9p
b2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAomZ3Q7ICZndDsgICAJCSAg
ICAgIEFNREdQVV9HRU1fQ1JFQVRFX05PX0NQVV9BQ0NFU1MgfAomZ3Q7ICZndDsgICAJCSAgICAg
IEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQyB8CiZndDsgJmd0OyAgIAkJICAgICAgQU1E
R1BVX0dFTV9DUkVBVEVfVlJBTV9DTEVBUkVEIHwKJmd0OyAmZ3Q7ICsJCSAgICAgIEFNREdQVV9H
RU1fQ1JFQVRFX1ZSQU1fQ09OVElHVU9VUyB8CiZndDsgJmd0OyAgIAkJICAgICAgQU1ER1BVX0dF
TV9DUkVBVEVfVk1fQUxXQVlTX1ZBTElEIHwKJmd0OyAmZ3Q7ICAgCQkgICAgICBBTURHUFVfR0VN
X0NSRUFURV9FWFBMSUNJVF9TWU5DIHwKJmd0OyAmZ3Q7ICAgCQkgICAgICBBTURHUFVfR0VNX0NS
RUFURV9FTkNSWVBURUQpKQo8L2NoZW5sZWkxOHNAaWN0LmFjLmNuPjwvY2hlbmxlaTE4c0BpY3Qu
YWMuY24+PC9ja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
