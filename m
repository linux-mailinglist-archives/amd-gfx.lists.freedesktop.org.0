Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9101C18C6F
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 16:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059A289D40;
	Thu,  9 May 2019 14:55:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sonic301-20.consmr.mail.sg3.yahoo.com
 (sonic301-20.consmr.mail.sg3.yahoo.com [106.10.242.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C2D89D40
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 14:55:00 +0000 (UTC)
X-YMail-OSG: emsKKvcVM1kmgvAnVlRIA6VJd4I05KFdEH9kAMVn0JjRcMzxJKragLg_HJtoEIe
 u44KCIQ49v1CDARllrSyNRAKO66n_Rc36HlqwHHxk3pMOUBH91b8SbMbEwqqhc6N6ul1VfElaM3W
 86Hs0.pPOUgV4_NBTipM4KcibsDaZlQ46cESYvuILhmPgzQmlQVmvetgPmnT1FEBGeeF5v8O1XTb
 Z_dyCXnheBK3.qb7w3Y61G2paiXgWp9VUO2DSmYujjhM3ltABLEpcPmCSIt0oo.kddDUf16y0VjH
 S4Zw8EiMa1psndQQKdoxnt1jaL29nGqbnJXDvWfuWxjFeSSYx.KF8aesUNetJRIu40uqwZskrLzO
 SozZJImjDM_HVEi8U6j6H0l44QhO6hsEeIuzRkjvr2m5COXAF0p.16cenf683VX4C1nb_EY.Ip.O
 ZBeQF2.xa4BskroqW0hZPyKtnOzw8pFz_cO0bpFdvhqslq8cm1d7e4MfVn23OuEWbyTexFnxOxT_
 NLUpf9lJ2jZ6VvNNVLRFHXjsBwCsuBWYuVleeAYhEw3a_.5j97BnlvQdJFX_Va9ENURDbauXnh6B
 zVKJ9V60C._IT_Z7LKr7XCWsIWuECN_IJpvuuqdxNF_Ud.uM88m1_AmFys2PL2.KW1.kKu.0fBCQ
 TEzIsQlS_RfOA88n72ec5ROpR_SPh47kLWkCh2NnxpDY0wARd8yAjKtg.BsxrEG8L5JFTbr4meIP
 rxSa_BC_NVzEtQexXyY0oi4CN8Zj.BgkmaEox.4ctX5W7qcX9dL1HDZoB2_2blzqa9Ha2hnr_n3W
 VgtmHsRU5sqGYhDbtBoFe7vbtXSCu6yxoUE6xag5yrXHoQiYBBjVGip8qXWb2pwynYcskQAbjqtQ
 Af_t4NeYidr8mIwxcoq5UuIRVUGMIHK8ZtwcF0urHDHHQj4ZZVl8QeLoWHrYH7.6s1s7j7V5D8Be
 aGMB1jC7E6POynfdKYqY4xFjVBebHJpYZVOc8KhaIEza.wAsLE5ip51uIWR1iBJZ_TzBv5s.aO2O
 5WCsnYccQVqTrsU5jaS.bVldtsFiL_ZVguXA4v7wJy4kSBqOgSser8Ld3W5PhrWIcJ11NY7r5Q.O
 NjKC3gEOdx1SFVEw0S.c.SP84ytvLpcFPSIjZgPrV
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.sg3.yahoo.com with HTTP; Thu, 9 May 2019 14:54:56 +0000
Received: from 116.234.190.237 (EHLO [192.168.2.217]) ([116.234.190.237])
 by smtp410.mail.sg3.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
 25d242a406188548727d62d29c6a8cc0 for <amd-gfx@lists.freedesktop.org>;
 Thu, 09 May 2019 14:54:55 +0000 (UTC)
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
From: wormwang <wormwang@yahoo.com>
Subject: program become uninterrupt(STAT D) when run 64 graphics program in
 sub window
Message-ID: <22df3c31-00af-6b43-9845-07025318d6e5@yahoo.com>
Date: Thu, 9 May 2019 22:54:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1557413696;
 bh=HdqfntLaAGAjy9Oz1ZOYQvjgoaK7r/ClgqkB8SuRsrk=;
 h=To:From:Subject:Date:From:Subject;
 b=XcDKw78ROfvbEyp4CaQHMvtyaiyIo68Ws290Gng16DIzU4zpRGWAfjRR+NIFCLP0Wu3JDcAMvu+dvPT7NtfYQHay8Xp9D/Cd1zYKX3Q23r7Zakyjw7W06Gd38a1rOymnCSZNOAdJfJQ5UCGFF+sNKq7fpVrpn29jAO0RJqKQluJ3DDFXi5k4JquLYjf3gwzpwR4XFeFq9Y1EvdJbxPXZb/qygiYC5n0mxid4Xmc1XSKquiZBW0me3TBdiw2VNW24P+5jZoYhzTMSV+VMlsnHxB6lJEP5l8vkRyUaRzFQvZF8qzZ2ZIAm8jKyxXItqwjGLxsnD1jjD+X3PyJTmimR0w==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TGludXgga2VybmVsIDUuMCAsIGFtZCByeDU4MCBncHUgY2FyZAoKCjEgb3IgbWFueSBncmFwaGlj
cyBwcm9ncmFtIGJlY29tZSB1bmludGVycnVwdGVkKFNUQVQgRCkgd2hlbiBydW4gNjQgCmdyYXBo
aWNzIHByb2dyYW0gb2Ygc3ViLXdpbmRvdyBjb25jdXJyZW50bHkuCgpXZSBoYXZlIHRvIHJlYm9v
dCBtYWNoaW5lIHRvIHJlbGVhc2UgdGhlIHVuaW50ZXJydXB0ZWQoU1RBVCBEKSBwcm9ncmFtLgoK
V2UgaGF2ZSBzdWNoIGtlcm5lbCBsb2c6CgoKIMKga2VybmVsOiBSZW5kZXJUaHJlYWQgRCAwIDM5
Mzc4NiAzMzcyNDIgMHgwMDQwMDAwOAogwqBrZXJuZWw6IENhbGwgdHJhY2U6CiDCoGtlcm5lbDog
X19zd2l0Y2hfdG8rMHhiYy8weDFjMAogwqBrZXJuZWw6IF9fc2NoZWR1bGUrMHgzZmMvMHhjYTAK
IMKga2VybmVsOiAweGZmZmY4MDFmZDMyYTAwMDAKIMKga2VybmVsOiBUUC1Jb0JvdW5kLTIgRCAw
IDQwMDIwMCAzMzcyNDIgMHgwMDQwMDAyZAogwqBrZXJuZWw6IENhbGwgdHJhY2U6CiDCoGtlcm5l
bDogX19zd2l0Y2hfdG8rMHhiYy8weDFjMAogwqBrZXJuZWw6IF9fc2NoZWR1bGUrMHgzZmMvMHhj
YTAKIMKga2VybmVsOiBzY2hlZHVsZSsweDQwLzB4OTgKIMKga2VybmVsOiBzY2hlZHVsZV9wcmVl
bXB0X2Rpc2FibGVkKzB4MjgvMHg0MAogwqBrZXJuZWw6IF9fbXV0ZXhfbG9jaysweDI2NC8weDg1
MAogwqBrZXJuZWw6IG11dGV4X2xvY2tfbmVzdGVkKzB4M2MvMHg1MAogwqBrZXJuZWw6IGRybV9y
ZWxlYXNlKzB4M2MvMHhkOCBbZHJtXQogwqBrZXJuZWw6IF9fZnB1dCsweGMwLzB4MjMwCiDCoGtl
cm5lbDogX19fX2ZwdXQrMHgyMC8weDMwCiDCoGtlcm5lbDogdGFza193b3JrX3J1bisweGEwLzB4
ZDAKIMKga2VybmVsOiBkb19leGl0KzB4MzY0LzB4YjUwCiDCoGtlcm5lbDogZG9fZ3JvdXBfZXhp
dCsweDQwLzB4YTgKIMKga2VybmVsOiBnZXRfc2lnbmFsKzB4ZjAvMHg5NzAKIMKga2VybmVsOiBk
b19ub3RpZnlfcmVzdW1lKzB4MmFjLzB4MzkwCiDCoGtlcm5lbDogd29ya19wZW5kaW5nKzB4OC8w
eDE0CiDCoGtlcm5lbDogQm9vdEFuaW1hdGlvbiBEIDAgNDAwOTA1IDM5MzczNyAweDAwMDAwMDAw
CiDCoGtlcm5lbDogQ2FsbCB0cmFjZToKIMKga2VybmVsOiBfX3N3aXRjaF90bysweGJjLzB4MWMw
CiDCoGtlcm5lbDogX19zY2hlZHVsZSsweDNmYy8weGNhMAogwqBrZXJuZWw6IHNjaGVkdWxlKzB4
NDAvMHg5OAogwqBrZXJuZWw6IHNjaGVkdWxlX3ByZWVtcHRfZGlzYWJsZWQrMHgyOC8weDQwCiDC
oGtlcm5lbDogX19tdXRleF9sb2NrKzB4MjY0LzB4ODUwCiDCoGtlcm5lbDogbXV0ZXhfbG9ja19u
ZXN0ZWQrMHgzYy8weDUwCiDCoGtlcm5lbDogZHJtX3N0dWJfb3BlbisweDQ0LzB4MTE4IFtkcm1d
CiDCoGtlcm5lbDogY2hyZGV2X29wZW4rMHhhYy8weDFjMAogwqBrZXJuZWw6IGRvX2RlbnRyeV9v
cGVuKzB4MWM0LzB4MzcwCiDCoGtlcm5lbDogdmZzX29wZW4rMHgzOC8weDQ4CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
