Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA62BBE0A7
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 16:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F43E89E15;
	Wed, 25 Sep 2019 14:56:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 08D7189E15
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 14:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id EA1E32AA1A3;
 Wed, 25 Sep 2019 16:56:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ix0_tix8FpaG; Wed, 25 Sep 2019 16:56:05 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id B3D2B2AA05C;
 Wed, 25 Sep 2019 16:56:05 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92.2)
 (envelope-from <michel@daenzer.net>)
 id 1iD8i5-00067U-0r; Wed, 25 Sep 2019 16:56:05 +0200
Subject: Re: libdrm patch merge request
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "Ma, Le" <Le.Ma@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <BN8PR12MB305760FE5322B3C6DD2E8DB3F68E0@BN8PR12MB3057.namprd12.prod.outlook.com>
 <BN6PR12MB1809C92D191B63264A83B33BF78E0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <BN8PR12MB30579B6F51F169D42E84DE08F6890@BN8PR12MB3057.namprd12.prod.outlook.com>
 <d9b7c9bd-f3dd-c9c1-c99b-256b1bc979f8@daenzer.net>
 <BYAPR12MB28067959433398F26E3B0507F1850@BYAPR12MB2806.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Openpgp: preference=signencrypt
Autocrypt: addr=michel@daenzer.net; prefer-encrypt=mutual; keydata=
 mQGiBDsehS8RBACbsIQEX31aYSIuEKxEnEX82ezMR8z3LG8ktv1KjyNErUX9Pt7AUC7W3W0b
 LUhu8Le8S2va6hi7GfSAifl0ih3k6Bv1Itzgnd+7ZmSrvCN8yGJaHNQfAevAuEboIb+MaVHo
 9EMJj4ikOcRZCmQWw7evu/D9uQdtkCnRY9iJiAGxbwCguBHtpoGMxDOINCr5UU6qt+m4O+UD
 /355ohBBzzyh49lTj0kTFKr0Ozd20G2FbcqHgfFL1dc1MPyigej2gLga2osu2QY0ObvAGkOu
 WBi3LTY8Zs8uqFGDC4ZAwMPoFy3yzu3ne6T7d/68rJil0QcdQjzzHi6ekqHuhst4a+/+D23h
 Za8MJBEcdOhRhsaDVGAJSFEQB1qLBACOs0xN+XblejO35gsDSVVk8s+FUUw3TSWJBfZa3Imp
 V2U2tBO4qck+wqbHNfdnU/crrsHahjzBjvk8Up7VoY8oT+z03sal2vXEonS279xN2B92Tttr
 AgwosujguFO/7tvzymWC76rDEwue8TsADE11ErjwaBTs8ZXfnN/uAANgPLQjTWljaGVsIERh
 ZW56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD6IXgQTEQIAHgUCQFXxJgIbAwYLCQgHAwIDFQID
 AxYCAQIeAQIXgAAKCRBaga+OatuyAIrPAJ9ykonXI3oQcX83N2qzCEStLNW47gCeLWm/QiPY
 jqtGUnnSbyuTQfIySkK5AQ0EOx6FRRAEAJZkcvklPwJCgNiw37p0GShKmFGGqf/a3xZZEpjI
 qNxzshFRFneZze4f5LhzbX1/vIm5+ZXsEWympJfZzyCmYPw86QcFxyZflkAxHx9LeD+89Elx
 bw6wT0CcLvSv8ROfU1m8YhGbV6g2zWyLD0/naQGVb8e4FhVKGNY2EEbHgFBrAAMGA/0VktFO
 CxFBdzLQ17RCTwCJ3xpyP4qsLJH0yCoA26rH2zE2RzByhrTFTYZzbFEid3ddGiHOBEL+bO+2
 GNtfiYKmbTkj1tMZJ8L6huKONaVrASFzLvZa2dlc2zja9ZSksKmge5BOTKWgbyepEc5qxSju
 YsYrX5xfLgTZC5abhhztpYhGBBgRAgAGBQI7HoVFAAoJEFqBr45q27IAlscAn2Ufk2d6/3p4
 Cuyz/NX7KpL2dQ8WAJ9UD5JEakhfofed8PSqOM7jOO3LCA==
Message-ID: <8b53d5c6-34d4-49de-f29e-044cf8552432@daenzer.net>
Date: Wed, 25 Sep 2019 16:56:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB28067959433398F26E3B0507F1850@BYAPR12MB2806.namprd12.prod.outlook.com>
Content-Language: en-CA
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

T24gMjAxOS0wOS0yMyAxMDoyOSBhLm0uLCBDaGVuLCBHdWNodW4gd3JvdGU6Cj4gSGkgTWljaGVs
LAo+IAo+IENhbiB5b3UgaGVscCBpbGx1c3RyYXRlIG1vcmUgYWJvdXQgdXNpbmcgTVJzIHRvIHBy
b2NlZWQgbGliZHJtIGNoYW5nZXM/IFdlIGNhbiB1c2UgZ2l0bGFiIHRvIG1lcmdlIHRoZSBjaGFu
Z2UgZnJvbSBvdXIgbG9jYWwgZm9ya2VkIHJlcG9zaXRvcnkgdG8gZHJtIG1hc3RlciByZXBvc2l0
b3J5PwoKWWVzLiBBbnlib2R5IHdobyBoYXMgd3JpdGUgYWNjZXNzIHRvIG1hc3RlciBjYW4gbWVy
Z2UgYW4gTVIgYXQgdGhlIGNsaWNrCm9mIGEgYnV0dG9uLCBhbmQgdGhlIE1SIHBhZ2UgY29udGFp
bnMgYWxsIHJlbGV2YW50IGluZm9ybWF0aW9uLCBpbgpwYXJ0aWN1bGFyIHRoZSBDSSBwaXBlbGlu
ZSBzdGF0dXMuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFz
dCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
