Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD6419D7C5
	for <lists+amd-gfx@lfdr.de>; Fri,  3 Apr 2020 15:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB05B6EB93;
	Fri,  3 Apr 2020 13:38:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0E56EB93
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 Apr 2020 13:38:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhiVtOUzpa1jT8U+mnpyiUACR/+Y7R/cO6dPo0PeHRteRqglbnsKvAtGcJ5kaG0RB735ch9Njy5jd2AUi+pxxCDhWF1oAU5aBkOZFiguV4Q/VJkpei1SBUFNmWflktwqf4TAZNzlQk9RuvPsXyfVjGeIxuBd9vTOLxCWM281XQ6NyG/D+/IjgVy2t8ZuL8AHby8TqzSDxhsrJSeg2/eOxO9BdwKM52fMLAmQUCyVOXOg0CjMo0sR0ooBjCrCiZb42ENNNJeCfyk+biVZq3kM5RleQuZcgNeOhbxn1V/FHCVJ+oojsIwTDEHLAbWyixZigKFPIFYFtRK3WGxin5ImLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxLbT5wivMUk+tlQAreKMNQaF8lwdGqxadSklKEjzEo=;
 b=h7Yd5FCFs7pAVQaShGTjL80XFoBbUyzr3taxcOBjjM++aATGr+j4rCsKZFNCvd04hUsI3c727WKGTG/peYdkvxSjgo7hXBBz5jQfAyWpYSTiWVCHOrdvq8euwx+98r5KIz410GHYZ/XH1D2ECSxapPGO7mJAAm5yjICPhCnBU2+WuJFGT/4qmINnppBWBu7q1+9fRVHHSF4jnLp+ud+nVPm2ZxkL5CNVQN07ovJ2S+GIHpZLXK+u79XTsH0ckLwrRLh4NwczgSibl8G05P7kKZjXSPhBEN/IIOx+IVqnMXyLBSCh/dGG3T6Z1ti3HEgxRx0AFQ4Xg+NTS4mFsLlPnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxLbT5wivMUk+tlQAreKMNQaF8lwdGqxadSklKEjzEo=;
 b=NtURzL/6q3o3wiSrT4yQ+Zq7QkTjrMUgJy/03XRXKki7+RZWn8VVy0llj+DEtc9iLo9lBmPmbVoDfmFD+VN6gTKXWaBzMSB7AK45x8ratVevr3FC6j3TczyjTo5YrMZUOscHn5X/yycLDE/o8V75FNWc9wWQOpRoooSbWpvGgLk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Amber.Lin@amd.com; 
Received: from BN8PR12MB3041.namprd12.prod.outlook.com (2603:10b6:408:46::11)
 by BN8PR12MB3409.namprd12.prod.outlook.com (2603:10b6:408:46::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Fri, 3 Apr
 2020 13:38:46 +0000
Received: from BN8PR12MB3041.namprd12.prod.outlook.com
 ([fe80::a421:2af7:645a:a051]) by BN8PR12MB3041.namprd12.prod.outlook.com
 ([fe80::a421:2af7:645a:a051%6]) with mapi id 15.20.2878.018; Fri, 3 Apr 2020
 13:38:45 +0000
Subject: Re: [PATCH v2] drm/amdkfd: Provide SMI events watch
To: Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org
References: <1585860379-460-1-git-send-email-Amber.Lin@amd.com>
 <a29d9eeb-9cbb-9e5b-75aa-c1f21959e66d@amd.com>
From: Amber Lin <Amber.Lin@amd.com>
Message-ID: <618e601f-c90c-8c2a-f302-ac825aea699d@amd.com>
Date: Fri, 3 Apr 2020 09:38:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <a29d9eeb-9cbb-9e5b-75aa-c1f21959e66d@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::43) To BN8PR12MB3041.namprd12.prod.outlook.com
 (2603:10b6:408:46::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.18] (72.141.223.142) by
 YTXPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.15 via Frontend Transport; Fri, 3 Apr 2020 13:38:45 +0000
X-Originating-IP: [72.141.223.142]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0b25635f-7e7d-4d23-95d4-08d7d7d45508
X-MS-TrafficTypeDiagnostic: BN8PR12MB3409:|BN8PR12MB3409:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR12MB34091F76AD46EBA12B907176E1C70@BN8PR12MB3409.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0362BF9FDB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3041.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(81156014)(6486002)(2616005)(66946007)(31696002)(66476007)(8936002)(81166006)(8676002)(2906002)(86362001)(5660300002)(66556008)(36756003)(26005)(53546011)(16576012)(478600001)(316002)(31686004)(30864003)(16526019)(52116002)(956004)(186003);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JzKY4pRIFfU07LAZheKt736zQdorhkAI2d8hBVBs88asSsoPhT3NfuG9FI7sssiPIdmSVAFok/WOeSI8MMo0Y9QijR/q0gr8Qsd+HH3hzTyt1fSezGSXmEv5qHOkEi/+9O7xYv+f+DHw0DmEw8cN3yWPDXB7eL5tFj148lrfZhrQKzp/SJyg8jD8QNOJLts5sBm2vnjY4IS9r1flQJFxEmmKPTwA9oEQY0dGwkZTRqZKJHZaXm9eTWB1CjGVCASx5UsQgfhdgMW07a/wcp22FuWBI7ZwTjl4vHfqnFk6sreK3XumHgJhzSG0feez3QmsoTGDASgeO3JGwaCetHkV8kBeyKXy/SkEiypw46SwaqCWjCTLrug7Ih4xdWU/ABPkqjr83VVtoYlNRxBlCx4IIYsYldspuIKgq6oMl3k+gtBpIU6P6/ZviUpV9B9Ea8ma
X-MS-Exchange-AntiSpam-MessageData: zVedAeyyL/4lvmhHxkuOirPKnWAeU73rMtbsKUHpKBl/jQ6T2AuY2+VQypxZ5GVybUMjYuOyWhZQGHWkoIKmdsYJCfOFdqr0ik0N7m/PUG/QvkjwKoxh5HJ7DPPD75fmY5dUKbuBighsfKYiW7pTsA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b25635f-7e7d-4d23-95d4-08d7d7d45508
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2020 13:38:45.8197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGeTPIipG+s+mbVbNU092ZQkyJJSM+K0/TuffVtpO2XZA3vMkVkVmSvI+cImhkN7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3409
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIEZlbGl4LiBJJ2xsIG1ha2UgY2hhbmdlcyBhY2NvcmRpbmdseSBidXQgcGxlYXNlIHBh
eSBhdHRlbnRpb24gdG8gCm15IGxhc3QgcmVwbHkgaW5saW5lLgoKT24gMjAyMC0wNC0wMiA3OjUx
IHAubS4sIEZlbGl4IEt1ZWhsaW5nIHdyb3RlOgo+IE9uIDIwMjAtMDQtMDIgNDo0NiBwLm0uLCBB
bWJlciBMaW4gd3JvdGU6Cj4+IFdoZW4gdGhlIGNvbXB1dGUgaXMgbWFsZnVuY3Rpb25pbmcgb3Ig
cGVyZm9ybWFuY2UgZHJvcHMsIHRoZSBzeXN0ZW0gCj4+IGFkbWluCj4+IHdpbGwgdXNlIFNNSSAo
U3lzdGVtIE1hbmFnZW1lbnQgSW50ZXJmYWNlKSB0b29sIHRvIG1vbml0b3IvZGlhZ25vc3RpYyAK
Pj4gd2hhdAo+PiB3ZW50IHdyb25nLiBUaGlzIHBhdGNoIHByb3ZpZGVzIGFuIGV2ZW50IHdhdGNo
IGludGVyZmFjZSBmb3IgdGhlIHVzZXIKPj4gc3BhY2UgdG8gcmVnaXN0ZXIgZXZlbnRzIHRoZXkg
YXJlIGludGVyZXN0ZWQuIEFmdGVyIHRoZSBldmVudCBpcwo+PiByZWdpc3RlcmVkLCB0aGUgdXNl
ciBjYW4gdXNlIGFubm95bW91cyBmaWxlIGRlc2NyaXB0b3IncyBwb2xsIGZ1bmN0aW9uCj4+IHdp
dGggd2FpdC10aW1lIHNwZWNpZmllZCB0byB3YWl0IGZvciB0aGUgZXZlbnQgdG8gaGFwcGVuLiBP
bmNlIHRoZSBldmVudAo+PiBoYXBwZW5zLCB0aGUgdXNlciBjYW4gdXNlIHJlYWQoKSB0byByZXRy
aWV2ZSBpbmZvcm1hdGlvbiByZWxhdGVkIHRvIHRoZQo+PiBldmVudC4KPj4KPj4gVk0gZmF1bHQg
ZXZlbnQgaXMgZG9uZSBpbiB0aGlzIHBhdGNoLgo+Pgo+PiB2MjogLSByZW1vdmUgVU5SRUdJU1RF
UiBhbmQgYWRkIGV2ZW50IEVOQUJMRS9ESVNBQkxFCj4+IMKgwqDCoMKgIC0gY29ycmVjdCBrZmlm
byB1c2FnZQo+PiDCoMKgwqDCoCAtIG1vdmUgZXZlbnQgbWVzc2FnZSBBUEkgdG8ga2ZkX2lvY3Rs
LmgKPj4KPj4gU2lnbmVkLW9mZi1ieTogQW1iZXIgTGluIDxBbWJlci5MaW5AYW1kLmNvbT4KPj4g
LS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL01ha2VmaWxlwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9jaWtfZXZlbnRfaW50ZXJydXB0LmMgfMKgwqAgMiArCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmPCoMKgwqDCoMKgwqDCoMKgIHzCoCAzMCArKysrCj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuY8KgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCAxICsKPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ludF9wcm9j
ZXNzX3Y5LmPCoCB8wqDCoCAyICsKPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3ByaXYuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEyICsrCj4+IMKgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9zbWlfZXZlbnRzLmPCoMKgwqDCoMKgIHwgMTc3IAo+PiArKysr
KysrKysrKysrKysrKysrKysrKwo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
c21pX2V2ZW50cy5owqDCoMKgwqDCoCB8wqAgMzEgKysrKwo+PiDCoCBpbmNsdWRlL3VhcGkvbGlu
dXgva2ZkX2lvY3RsLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMw
ICsrKy0KPj4gwqAgOSBmaWxlcyBjaGFuZ2VkLCAyODYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9zbWlfZXZlbnRzLmMKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9zbWlfZXZlbnRzLmgKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL01ha2VmaWxlIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL01ha2VmaWxlCj4+IGluZGV4IDYxNDc0NjIuLmNjOThiNGEgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL01ha2VmaWxlCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL01ha2VmaWxlCj4+IEBAIC01Myw3ICs1Myw4IEBAIEFNREtGRF9GSUxFU8Kg
wqDCoCA6PSAkKEFNREtGRF9QQVRIKS9rZmRfbW9kdWxlLm8gXAo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgJChBTURLRkRfUEFUSCkva2ZkX2ludF9wcm9jZXNzX3Y5Lm8gXAo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgJChBTURLRkRfUEFUSCkva2ZkX2RiZ2Rldi5vIFwKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
ICQoQU1ES0ZEX1BBVEgpL2tmZF9kYmdtZ3IubyBcCj4+IC3CoMKgwqDCoMKgwqDCoCAkKEFNREtG
RF9QQVRIKS9rZmRfY3JhdC5vCj4+ICvCoMKgwqDCoMKgwqDCoCAkKEFNREtGRF9QQVRIKS9rZmRf
Y3JhdC5vIFwKPj4gK8KgwqDCoMKgwqDCoMKgICQoQU1ES0ZEX1BBVEgpL2tmZF9zbWlfZXZlbnRz
Lm8KPj4gwqAgwqAgaWZuZXEgKCQoQ09ORklHX0FNRF9JT01NVV9WMiksKQo+PiDCoCBBTURLRkRf
RklMRVMgKz0gJChBTURLRkRfUEFUSCkva2ZkX2lvbW11Lm8KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2Npa19ldmVudF9pbnRlcnJ1cHQuYyAKPj4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9jaWtfZXZlbnRfaW50ZXJydXB0LmMKPj4gaW5kZXggOWY1OWJh
OS4uMjRiNDcxNyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQvY2lr
X2V2ZW50X2ludGVycnVwdC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2Np
a19ldmVudF9pbnRlcnJ1cHQuYwo+PiBAQCAtMjQsNiArMjQsNyBAQAo+PiDCoCAjaW5jbHVkZSAi
a2ZkX2V2ZW50cy5oIgo+PiDCoCAjaW5jbHVkZSAiY2lrX2ludC5oIgo+PiDCoCAjaW5jbHVkZSAi
YW1kZ3B1X2FtZGtmZC5oIgo+PiArI2luY2x1ZGUgImtmZF9zbWlfZXZlbnRzLmgiCj4+IMKgIMKg
IHN0YXRpYyBib29sIGNpa19ldmVudF9pbnRlcnJ1cHRfaXNyKHN0cnVjdCBrZmRfZGV2ICpkZXYs
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCB1aW50
MzJfdCAqaWhfcmluZ19lbnRyeSwKPj4gQEAgLTEwNyw2ICsxMDgsNyBAQCBzdGF0aWMgdm9pZCBj
aWtfZXZlbnRfaW50ZXJydXB0X3dxKHN0cnVjdCBrZmRfZGV2IAo+PiAqZGV2LAo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgaWhyZS0+c291cmNlX2lkID09IENJS19JTlRTUkNfR0ZYX01FTV9QUk9UX0ZB
VUxUKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qga2ZkX3ZtX2ZhdWx0X2luZm8gaW5m
bzsKPj4gwqAgK8KgwqDCoMKgwqDCoMKgIGtmZF9zbWlfZXZlbnRfdXBkYXRlX3ZtZmF1bHQoZGV2
LCBwYXNpZCk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBrZmRfcHJvY2Vzc192bV9mYXVsdChkZXYt
PmRxbSwgcGFzaWQpOwo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtc2V0KCZpbmZvLCAwLCBz
aXplb2YoaW5mbykpOwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2NoYXJkZXYuYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRl
di5jCj4+IGluZGV4IGY4ZmEwM2EuLjU5MWFjMjggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2NoYXJkZXYuYwo+PiBAQCAtMzksNiArMzksNyBAQAo+PiDCoCAjaW5jbHVk
ZSAia2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmgiCj4+IMKgICNpbmNsdWRlICJrZmRfZGJnbWdy
LmgiCj4+IMKgICNpbmNsdWRlICJhbWRncHVfYW1ka2ZkLmgiCj4+ICsjaW5jbHVkZSAia2ZkX3Nt
aV9ldmVudHMuaCIKPj4gwqAgwqAgc3RhdGljIGxvbmcga2ZkX2lvY3RsKHN0cnVjdCBmaWxlICos
IHVuc2lnbmVkIGludCwgdW5zaWduZWQgbG9uZyk7Cj4+IMKgIHN0YXRpYyBpbnQga2ZkX29wZW4o
c3RydWN0IGlub2RlICosIHN0cnVjdCBmaWxlICopOwo+PiBAQCAtMTI0Myw2ICsxMjQ0LDMyIEBA
IHN0YXRpYyBpbnQga2ZkX2lvY3RsX2FjcXVpcmVfdm0oc3RydWN0IGZpbGUgCj4+ICpmaWxlcCwg
c3RydWN0IGtmZF9wcm9jZXNzICpwLAo+PiDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+IMKgIH0K
Pj4gwqAgKy8qIEhhbmRsZSByZXF1ZXN0cyBmb3Igd2F0Y2hpbmcgU01JIGV2ZW50cyAqLwo+PiAr
c3RhdGljIGludCBrZmRfaW9jdGxfc21pX2V2ZW50cyhzdHJ1Y3QgZmlsZSAqZmlsZXAsCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGtmZF9wcm9jZXNzICpwLCB2b2lk
ICpkYXRhKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBrZmRfaW9jdGxfc21pX2V2ZW50c19hcmdz
ICphcmdzID0gZGF0YTsKPj4gK8KgwqDCoCBzdHJ1Y3Qga2ZkX2RldiAqZGV2Owo+PiArCj4+ICvC
oMKgwqAgZGV2ID0ga2ZkX2RldmljZV9ieV9pZChhcmdzLT5ncHVfaWQpOwo+PiArwqDCoMKgIGlm
ICghZGV2KQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gK8KgwqDC
oCBzd2l0Y2ggKGFyZ3MtPm9wKSB7Cj4+ICvCoMKgwqAgY2FzZSBLRkRfU01JX0VWRU5UU19SRUdJ
U1RFUjoKPj4gK8KgwqDCoMKgwqDCoMKgIC8qIHJlZ2lzdGVyIHRoZSBkZXZpY2UgKi8KPj4gK8Kg
wqDCoMKgwqDCoMKgIHJldHVybiBrZmRfc21pX2V2ZW50X3JlZ2lzdGVyKGRldiwgJmFyZ3MtPmRh
dGEpOwo+PiArwqDCoMKgIGNhc2UgS0ZEX1NNSV9FVkVOVFNfRU5BQkxFOgo+PiArwqDCoMKgwqDC
oMKgwqAgLyogc3Vic2NyaWJlIGV2ZW50cyB0byB0aGUgZGV2aWNlICovCj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4ga2ZkX3NtaV9ldmVudF9lbmFibGUoZGV2LCBhcmdzLT5ldmVudHMpOwo+PiAr
wqDCoMKgIGNhc2UgS0ZEX1NNSV9FVkVOVFNfRElTQUJMRToKPj4gK8KgwqDCoMKgwqDCoMKgIC8q
IHVuc3Vic2NyaWJlIGV2ZW50cyAqLwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGtmZF9zbWlf
ZXZlbnRfZGlzYWJsZShkZXYsIGFyZ3MtPmV2ZW50cyk7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvC
oMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+ICt9Cj4+ICsKPj4gwqAgYm9vbCBrZmRfZGV2X2lzX2xh
cmdlX2JhcihzdHJ1Y3Qga2ZkX2RldiAqZGV2KQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0
IGtmZF9sb2NhbF9tZW1faW5mbyBtZW1faW5mbzsKPj4gQEAgLTE4MjcsNiArMTg1NCw5IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgYW1ka2ZkX2lvY3RsX2Rlc2MgCj4+IGFtZGtmZF9pb2N0bHNbXSA9
IHsKPj4gwqAgwqDCoMKgwqDCoCBBTURLRkRfSU9DVExfREVGKEFNREtGRF9JT0NfQUxMT0NfUVVF
VUVfR1dTLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrZmRfaW9jdGxfYWxsb2NfcXVl
dWVfZ3dzLCAwKSwKPj4gKwo+PiArwqDCoMKgIEFNREtGRF9JT0NUTF9ERUYoQU1ES0ZEX0lPQ19T
TUlfRVZFTlRTLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrZmRfaW9jdGxfc21pX2V2ZW50
cywgMCksCj4+IMKgIH07Cj4+IMKgIMKgICNkZWZpbmUgQU1ES0ZEX0NPUkVfSU9DVExfQ09VTlTC
oMKgwqAgQVJSQVlfU0laRShhbWRrZmRfaW9jdGxzKQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2UuYwo+PiBpbmRleCAwNDkxYWIyLi42YWM2ZjMxIDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCj4+IEBAIC01MzIsNiArNTMyLDcg
QEAgc3RydWN0IGtmZF9kZXYgKmtnZDJrZmRfcHJvYmUoc3RydWN0IGtnZF9kZXYgKmtnZCwKPj4g
wqDCoMKgwqDCoCBrZmQtPmRldmljZV9pbmZvID0gZGV2aWNlX2luZm87Cj4+IMKgwqDCoMKgwqAg
a2ZkLT5wZGV2ID0gcGRldjsKPj4gwqDCoMKgwqDCoCBrZmQtPmluaXRfY29tcGxldGUgPSBmYWxz
ZTsKPj4gK8KgwqDCoCBrZmQtPnNtaV9ldmVudHMucmVnaXN0ZXJlZCA9IGZhbHNlOwo+PiDCoMKg
wqDCoMKgIGtmZC0+a2ZkMmtnZCA9IGYyZzsKPj4gwqDCoMKgwqDCoCBhdG9taWNfc2V0KCZrZmQt
PmNvbXB1dGVfcHJvZmlsZSwgMCk7Cj4+IMKgIGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYwo+PiBpbmRleCBlMDVkNzVlLi4xNTFlODNlIDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3Nf
djkuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3Nf
djkuYwo+PiBAQCAtMjQsNiArMjQsNyBAQAo+PiDCoCAjaW5jbHVkZSAia2ZkX2V2ZW50cy5oIgo+
PiDCoCAjaW5jbHVkZSAic29jMTVfaW50LmgiCj4+IMKgICNpbmNsdWRlICJrZmRfZGV2aWNlX3F1
ZXVlX21hbmFnZXIuaCIKPj4gKyNpbmNsdWRlICJrZmRfc21pX2V2ZW50cy5oIgo+PiDCoCDCoCBz
dGF0aWMgYm9vbCBldmVudF9pbnRlcnJ1cHRfaXNyX3Y5KHN0cnVjdCBrZmRfZGV2ICpkZXYsCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCB1aW50MzJf
dCAqaWhfcmluZ19lbnRyeSwKPj4gQEAgLTExNyw2ICsxMTgsNyBAQCBzdGF0aWMgdm9pZCBldmVu
dF9pbnRlcnJ1cHRfd3Ffdjkoc3RydWN0IGtmZF9kZXYgCj4+ICpkZXYsCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBpbmZvLnByb3RfcmVhZMKgID0gcmluZ19pZCAmIDB4MTA7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBpbmZvLnByb3Rfd3JpdGUgPSByaW5nX2lkICYgMHgyMDsKPj4gwqAgK8KgwqDCoMKg
wqDCoMKgIGtmZF9zbWlfZXZlbnRfdXBkYXRlX3ZtZmF1bHQoZGV2LCBwYXNpZCk7Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBrZmRfcHJvY2Vzc192bV9mYXVsdChkZXYtPmRxbSwgcGFzaWQpOwo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAga2ZkX3NpZ25hbF92bV9mYXVsdF9ldmVudChkZXYsIHBhc2lkLCAm
aW5mbyk7Cj4+IMKgwqDCoMKgwqAgfQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3ByaXYuaCAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
cHJpdi5oCj4+IGluZGV4IDQzYjg4OGIuLmIxMGI2NjUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3ByaXYuaAo+PiBAQCAtMjIzLDYgKzIyMywxNSBAQCBzdHJ1Y3Qga2ZkX3Zt
aWRfaW5mbyB7Cj4+IMKgwqDCoMKgwqAgdWludDMyX3Qgdm1pZF9udW1fa2ZkOwo+PiDCoCB9Owo+
PiDCoCArc3RydWN0IGtmZF9zbWlfZXZlbnRzIHsKPj4gK8KgwqDCoCAvKiBkZXZpY2UgaXMgcmVn
aXN0ZXJlZCB0byB3YXRjaCBldmVudHMgKi8KPj4gK8KgwqDCoCBib29sIHJlZ2lzdGVyZWQ7Cj4+
ICvCoMKgwqAgLyogZXZlbnRzIGVuYWJsZWQgKi8KPj4gK8KgwqDCoCB1aW50MzJfdCBldmVudHM7
Cj4KPiBUaGlzIHNob3VsZCBiZSA2NC1iaXQgdG8gYWxsb3cgZm9yIG1vcmUgZnV0dXJlIGV4cGFu
c2lvbi4gSXQgZG9lc24ndCAKPiBtYXR0ZXIgYXMgbXVjaCBoZXJlLCBiZWNhdXNlIHlvdSBjYW4g
YWx3YXlzIGNoYW5nZSB0aGUgaW50ZXJuYWwgaGVhZGVyIAo+IGxhdGVyLiBCdXQgaW4gdGhlIGlv
Y3RsIEFQSSB3ZSBjYW4ndCBjaGFuZ2UgaXQgbGF0ZXIsIHNvIHdlIHNob3VsZCAKPiBkZWZpbmUg
aXQgYXMgNjQtYml0IGZyb20gdGhlIHN0YXJ0Lgo+Ck9rLCBJJ2xsIGNoYW5nZSBiYWNrIHRvIDY0
IGJpdHMuIEkgd2FzIHRoaW5raW5nIHRvIHVzZSAiZGF0YSIgYXMgZ3JvdXAgCmlmIHdlIGhhdmUg
dG8gcnVuIG91dCBvZiBiaXRzIGFueXdheSwgYnV0IHdpdGggZnVydGhlciB0aGlua2luZywgd2Ug
Y2FuIApzcXVpc2ggc2V2ZXJhbCBldmVudHMgaW50byBvbmUgc2luY2UgaXQncyBldmVudCAidHlw
ZSIsIG5vdCAiSUQiLiA2NCAKd2lsbCBiZSBxdWl0ZSBzdWZmaWNpZW50IGFuZCBubyBuZWVkIHRv
IHdvcnJ5IGFib3V0IHJ1bm5pbmcgb3V0IG9mIGl0Lgo+Cj4+ICvCoMKgwqAgREVDTEFSRV9LRklG
T19QVFIoZmlmbywgdWludDMyX3QpOwo+PiArwqDCoMKgIHdhaXRfcXVldWVfaGVhZF90IHdhaXRf
cXVldWU7Cj4+ICt9Owo+PiArCj4+IMKgIHN0cnVjdCBrZmRfZGV2IHsKPj4gwqDCoMKgwqDCoCBz
dHJ1Y3Qga2dkX2RldiAqa2dkOwo+PiDCoCBAQCAtMzA5LDYgKzMxOCw5IEBAIHN0cnVjdCBrZmRf
ZGV2IHsKPj4gwqAgwqDCoMKgwqDCoCAvKiBHbG9iYWwgR1dTIHJlc291cmNlIHNoYXJlZCBiL3Qg
cHJvY2Vzc2VzKi8KPj4gwqDCoMKgwqDCoCB2b2lkICpnd3M7Cj4+ICsKPj4gK8KgwqDCoCAvKiBp
ZiB0aGlzIGRldmljZSBpcyBpbiBTTUkgZXZlbnRzIHdhdGNoICovCj4+ICvCoMKgwqAgc3RydWN0
IGtmZF9zbWlfZXZlbnRzIHNtaV9ldmVudHM7Cj4+IMKgIH07Cj4+IMKgIMKgIGVudW0ga2ZkX21l
bXBvb2wgewo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Nt
aV9ldmVudHMuYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfc21pX2V2ZW50
cy5jCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAuLmFhYjRkYWMKPj4g
LS0tIC9kZXYvbnVsbAo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfc21p
X2V2ZW50cy5jCj4+IEBAIC0wLDAgKzEsMTc3IEBACj4+ICsvKgo+PiArICogQ29weXJpZ2h0IDIw
MjAgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgo+PiArICoKPj4gKyAqIFBlcm1pc3Npb24g
aXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIAo+PiBvYnRh
aW5pbmcgYQo+PiArICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3Vt
ZW50YXRpb24gZmlsZXMgKHRoZSAKPj4gIlNvZnR3YXJlIiksCj4+ICsgKiB0byBkZWFsIGluIHRo
ZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCAKPj4gbGlt
aXRhdGlvbgo+PiArICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1
Ymxpc2gsIGRpc3RyaWJ1dGUsIAo+PiBzdWJsaWNlbnNlLAo+PiArICogYW5kL29yIHNlbGwgY29w
aWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gCj4+IHRo
ZQo+PiArICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBm
b2xsb3dpbmcgY29uZGl0aW9uczoKPj4gKyAqCj4+ICsgKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5v
dGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSAKPj4gaW5jbHVkZWQgaW4K
Pj4gKyAqIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJl
Lgo+PiArICoKPj4gKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VU
IFdBUlJBTlRZIE9GIEFOWSBLSU5ELCAKPj4gRVhQUkVTUyBPUgo+PiArICogSU1QTElFRCwgSU5D
TFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiAKPj4gTUVSQ0hBTlRB
QklMSVRZLAo+PiArICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklO
RlJJTkdFTUVOVC7CoCBJTiBOTyAKPj4gRVZFTlQgU0hBTEwKPj4gKyAqIFRIRSBDT1BZUklHSFQg
SE9MREVSKFMpIE9SIEFVVEhPUihTKSBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgCj4+IERBTUFH
RVMgT1IKPj4gKyAqIE9USEVSIExJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09O
VFJBQ1QsIFRPUlQgT1IgCj4+IE9USEVSV0lTRSwKPj4gKyAqIEFSSVNJTkcgRlJPTSwgT1VUIE9G
IE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIAo+PiBVU0UgT1IKPj4g
KyAqIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KPj4gKyAqLwo+PiArCj4+ICsjaW5j
bHVkZSA8bGludXgvcG9sbC5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3dhaXQuaD4KPj4gKyNpbmNs
dWRlIDxsaW51eC9hbm9uX2lub2Rlcy5oPgo+PiArI2luY2x1ZGUgPHVhcGkvbGludXgva2ZkX2lv
Y3RsLmg+Cj4+ICsjaW5jbHVkZSAiYW1kZ3B1X3ZtLmgiCj4+ICsjaW5jbHVkZSAia2ZkX3ByaXYu
aCIKPj4gKyNpbmNsdWRlICJrZmRfc21pX2V2ZW50cy5oIgo+PiArCj4+ICtzdGF0aWMgREVGSU5F
X01VVEVYKGtmZF9zbWlfbXV0ZXgpOwo+PiArc3RydWN0IG11dGV4ICprZmRfZ2V0X3NtaV9tdXRl
eCh2b2lkKQo+PiArewo+PiArwqDCoMKgIHJldHVybiAma2ZkX3NtaV9tdXRleDsKPj4gK30KPgo+
IFdoeSBkbyB5b3UgbmVlZCBhIGZ1bmN0aW9uIGZvciB0aGlzLiBKdXN0IHJlZmVyZW5jZSBrZmRf
c21pX211dGV4IAo+IGRpcmVjdGx5IGJlbG93LiBCdXQgc2luY2UgdGhlIGZpZm8gaXMgcGVyIGRl
dmljZSwgc2hvdWxkIHRoZXJlIGFsc28gYmUgCj4gb25lIG11dGV4IHBlciBkZXZpY2U/Cj4KSSdt
IG5vdCBzdXJlIGhvdyB0byBjcmVhdGUgbXV0ZXggZm9yIHNtaV9ldmVudCBzbyBJIHJlZmVyZW5j
ZWQgdGhlIApkZWJ1Z2dlciBjb2RlLgo+PiArCj4+ICtzdGF0aWMgX19wb2xsX3Qga2ZkX3NtaV9l
dl9wb2xsKHN0cnVjdCBmaWxlICosIHN0cnVjdCAKPj4gcG9sbF90YWJsZV9zdHJ1Y3QgKik7Cj4+
ICtzdGF0aWMgc3NpemVfdCBrZmRfc21pX2V2X3JlYWQoc3RydWN0IGZpbGUgKiwgY2hhciBfX3Vz
ZXIgKiwgc2l6ZV90LCAKPj4gbG9mZl90ICopOwo+PiArc3RhdGljIGludCBrZmRfc21pX2V2X3Jl
bGVhc2Uoc3RydWN0IGlub2RlICosIHN0cnVjdCBmaWxlICopOwo+PiArCj4+ICtzdGF0aWMgdWlu
dDMyX3Qgc21pX2ZpZm9fbGVuOwo+Cj4gVGhpcyBjb3VsZCBiZSBzdGF0aWNhbGx5IGluaXRpYWxp
emVkIHJhdGhlciB0aGFuIGRvaW5nIGl0IGluIGEgCj4gZnVuY3Rpb24gYmVsb3cgYmVjYXVzZSB0
aGlzIGNhbiBiZSBjYWxjdWxhdGVkIGF0IGNvbXBpbGUgdGltZS4gSXQncyAKPiBhbHNvIGNvbnN0
YW50Ogo+Cj4gc3RhdGljIGNvbnN0IHVpbnQzMl90IHNtaV9maWZvX2xlbiA9IDMyICogKHNpemVv
ZihzdHJ1Y3QgCj4ga2ZkX3NtaV9tc2dfdm1mYXVsdCkvc2l6ZW9mKHVpbnQzMl90KSArIDEpOwo+
Cj4gT3IgeW91IGNvdWxkIHByb2JhYmx5IGV2ZW4gbWFrZSBpcyBhICNkZWZpbmUuCj4KVHJ1ZS4g
SSdsbCBjaGFuZ2UgaXQuCj4KPj4gK3N0YXRpYyBjb25zdCBjaGFyIGtmZF9zbWlfbmFtZVtdID0g
ImtmZF9zbWlfZXYiOwo+PiArCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9u
cyBrZmRfc21pX2V2X2ZvcHMgPSB7Cj4+ICvCoMKgwqAgLm93bmVyID0gVEhJU19NT0RVTEUsCj4+
ICvCoMKgwqAgLnBvbGwgPSBrZmRfc21pX2V2X3BvbGwsCj4+ICvCoMKgwqAgLnJlYWQgPSBrZmRf
c21pX2V2X3JlYWQsCj4+ICvCoMKgwqAgLnJlbGVhc2UgPSBrZmRfc21pX2V2X3JlbGVhc2UKPj4g
K307Cj4+ICsKPj4gK3N0YXRpYyBfX3BvbGxfdCBrZmRfc21pX2V2X3BvbGwoc3RydWN0IGZpbGUg
KmZpbGVwLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBwb2xsX3Rh
YmxlX3N0cnVjdCAqd2FpdCkKPj4gK3sKPj4gK8KgwqDCoCBfX3BvbGxfdCBtYXNrOwo+PiArwqDC
oMKgIHN0cnVjdCBrZmRfZGV2ICpkZXYgPSBmaWxlcC0+cHJpdmF0ZV9kYXRhOwo+PiArCj4+ICvC
oMKgwqAgcG9sbF93YWl0KGZpbGVwLCAmZGV2LT5zbWlfZXZlbnRzLndhaXRfcXVldWUsIHdhaXQp
Owo+PiArwqDCoMKgIG1hc2sgPSBrZmlmb19pc19lbXB0eSgmZGV2LT5zbWlfZXZlbnRzLmZpZm8p
ID8gMDogUE9MTElOIHwgCj4+IFBPTExSRE5PUk07Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gbWFz
azsKPj4gK30KPj4gKwo+PiArc3RhdGljIHNzaXplX3Qga2ZkX3NtaV9ldl9yZWFkKHN0cnVjdCBm
aWxlICpmaWxlcCwgY2hhciBfX3VzZXIgKnVzZXIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc2l6ZV90IHNpemUsIGxvZmZfdCAqb2Zmc2V0KQo+PiArewo+PiArwqDC
oMKgIGludCByZXQsIGNvcGllZCA9IDA7Cj4+ICvCoMKgwqAgc3RydWN0IGtmZF9kZXYgKmRldiA9
IGZpbGVwLT5wcml2YXRlX2RhdGE7Cj4+ICsKPj4gK8KgwqDCoCBtdXRleF9sb2NrKGtmZF9nZXRf
c21pX211dGV4KCkpOwo+PiArwqDCoMKgIHJldCA9IGtmaWZvX3RvX3VzZXIoJmRldi0+c21pX2V2
ZW50cy5maWZvLCB1c2VyLCBzaXplLCAmY29waWVkKTsKPj4gK8KgwqDCoCBtdXRleF91bmxvY2so
a2ZkX2dldF9zbWlfbXV0ZXgoKSk7Cj4+ICvCoMKgwqAgaWYgKHJldCB8fCAhY29waWVkKSB7Cj4+
ICvCoMKgwqDCoMKgwqDCoCBwcl9kZWJ1Zygic21pLWV2ZW50czogZmFpbCB0byBzZW5kIG1zZyAo
JWkpICglaSlcbiIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCwgY29waWVkKTsKPj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQgPyByZXQgOiAtRUFHQUlOOwo+PiArwqDCoMKgIH0K
Pj4gKwo+PiArwqDCoMKgIHJldHVybiBjb3BpZWQ7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQg
a2ZkX3NtaV9ldl9yZWxlYXNlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxl
cCkKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3Qga2ZkX2RldiAqZGV2ID0gZmlsZXAtPnByaXZhdGVf
ZGF0YTsKPj4gKwo+PiArwqDCoMKgIGRldi0+c21pX2V2ZW50cy5ldmVudHMgPSAwOwo+PiArwqDC
oMKgIGtmaWZvX2ZyZWUoJmRldi0+c21pX2V2ZW50cy5maWZvKTsKPgo+IFRoaXMgY2FuIGNhdXNl
IHJhY2UgY29uZGl0aW9ucy4gWW91IHNob3VsZCBkbyB0aGlzIHVuZGVyIHRoZSBmaWZvIAo+IG11
dGV4LiBBbHNvIHNldCBkZXYtPnNtaV9ldmVudHMucmVnaXN0ZXJlZCA9IGZhbHNlIHRvIGFsbG93
IGEgbmV3IAo+IHJlZ2lzdHJhdGlvbiBhZnRlciB0aGlzLgo+Ckdvb2QgY2F0Y2guIEknbGwgYWRk
IHRoZW0uCj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArdm9pZCBrZmRf
c21pX2V2ZW50X3VwZGF0ZV92bWZhdWx0KHN0cnVjdCBrZmRfZGV2ICpkZXYsIHVpbnQxNl90IHBh
c2lkKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVj
dCBhbWRncHVfZGV2aWNlICopZGV2LT5rZ2Q7Cj4+ICvCoMKgwqAgc3RydWN0IGFtZGdwdV90YXNr
X2luZm8gdGFza19pbmZvOwo+PiArwqDCoMKgIHN0cnVjdCBrZmRfc21pX21zZ192bWZhdWx0IG1z
ZzsKPj4gK8KgwqDCoCB1aW50MzJfdCAqZmlmb19pbiA9ICh1aW50MzJfdCAqKSZtc2c7Cj4+ICvC
oMKgwqAgdWludDMyX3QgZmlmb19pbl9sZW4gPSBzaXplb2YobXNnKSAvIHNpemVvZih1aW50MzJf
dCk7Cj4+ICsKPj4gK8KgwqDCoCBpZiAoIShkZXYtPnNtaV9ldmVudHMuZXZlbnRzICYgS0ZEX1NN
SV9FVkVOVF9WTUZBVUxUKSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPgo+IFlvdSBuZWVk
IHRvIGRvIHRoaXMgd2hpbGUgaG9sZGluZyB0aGUgZmlmbyBtdXRleCwgb3RoZXJ3aXNlIHRoZSBm
aWZvIAo+IGNhbiBiZSBkZXN0cm95ZWQgYmVmb3JlIHlvdSBhY2Nlc3MgaXQgYmVsb3cuCj4KT2sK
Pgo+PiArCj4+ICvCoMKgwqAgYW1kZ3B1X3ZtX2dldF90YXNrX2luZm8oYWRldiwgcGFzaWQsICZ0
YXNrX2luZm8pOwo+PiArwqDCoMKgIG1zZy5waWQgPSB0YXNrX2luZm8ucGlkOwo+PiArwqDCoMKg
IHN0cm5jcHkobXNnLnRhc2tfbmFtZSwgdGFza19pbmZvLnRhc2tfbmFtZSwgMTYpOwo+PiArCj4+
ICvCoMKgwqAgbXV0ZXhfbG9jayhrZmRfZ2V0X3NtaV9tdXRleCgpKTsKPj4gK8KgwqDCoCBpZiAo
KGZpZm9faW5fbGVuICsgMSkgPgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoc21pX2ZpZm9f
bGVuIC0ga2ZpZm9fbGVuKCZkZXYtPnNtaV9ldmVudHMuZmlmbykpKSB7Cj4KPiBZb3UgY291bGQg
dXNlIGtmaWZvX2F2YWlsIHRvIGdldCB0aGUgc3BhY2UgYXZhaWxhYmxlIGluIHRoZSBmaWZvLgo+
CkFoLiBUaGFua3MuCj4KPj4gK8KgwqDCoMKgwqDCoMKgIHByX2Vycigic21pX2V2ZW50OiBubyBz
cGFjZSBsZWZ0IGZvciB2bWZhdWx0IGV2ZW50XG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKgIG11dGV4
X3VubG9jayhrZmRfZ2V0X3NtaV9tdXRleCgpKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsK
Pj4gK8KgwqDCoCB9Cj4+ICvCoMKgwqAgLyogQWx3YXlzIHNlbmQgdGhlIGV2ZW50IHR5cGUgZmly
c3QgdG8gZnVuY3Rpb24gYXMgYSBoZWFkZXIgKi8KPj4gK8KgwqDCoCBrZmlmb19wdXQoJmRldi0+
c21pX2V2ZW50cy5maWZvLCBLRkRfU01JX0VWRU5UX1ZNRkFVTFQpOwo+PiArwqDCoMKgIC8qIFRo
ZW4gdGhlIG1zZyBhcyB0aGUgcGF5bG9hZC4gRXZlbnQgdHlwZSByZXZlYWxzIHRoZSBwYXlsb2Fk
IAo+PiBzaXplLiAqLwo+PiArwqDCoMKgIGtmaWZvX2luKCZkZXYtPnNtaV9ldmVudHMuZmlmbywg
Zmlmb19pbiwgZmlmb19pbl9sZW4pOwo+PiArwqDCoMKgIG11dGV4X3VubG9jayhrZmRfZ2V0X3Nt
aV9tdXRleCgpKTsKPj4gKwo+PiArwqDCoMKgIHdha2VfdXBfYWxsKCZkZXYtPnNtaV9ldmVudHMu
d2FpdF9xdWV1ZSk7Cj4+ICt9Cj4+ICsKPj4gK2ludCBrZmRfc21pX2V2ZW50X2Rpc2FibGUoc3Ry
dWN0IGtmZF9kZXYgKmRldiwgdWludDY0X3QgZXZlbnRzKQo+PiArewo+PiArwqDCoMKgIG11dGV4
X2xvY2soa2ZkX2dldF9zbWlfbXV0ZXgoKSk7Cj4+ICvCoMKgwqAgZGV2LT5zbWlfZXZlbnRzLmV2
ZW50cyAmPSB+ZXZlbnRzOwo+PiArwqDCoMKgIG11dGV4X3VubG9jayhrZmRfZ2V0X3NtaV9tdXRl
eCgpKTsKPj4gKwo+PiArwqDCoMKgIHJldHVybiAwOwo+PiArfQo+PiArCj4+ICtpbnQga2ZkX3Nt
aV9ldmVudF9lbmFibGUoc3RydWN0IGtmZF9kZXYgKmRldiwgdWludDY0X3QgZXZlbnRzKQo+PiAr
ewo+PiArwqDCoMKgIC8qIElmIHRoZSB1c2VyIGRpZG4ndCByZWdpc3RlciBTTUkgZXZlbnRzIGZv
ciB0aGlzIGRldmljZSwga2ZpZm8gCj4+IGlzIG5vdAo+PiArwqDCoMKgwqAgKiBjcmVhdGVkIHRv
IHJlcG9ydCBldmVudHMuCj4+ICvCoMKgwqDCoCAqLwo+PiArwqDCoMKgIGlmICghZGV2LT5zbWlf
ZXZlbnRzLnJlZ2lzdGVyZWQpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4g
Kwo+PiArwqDCoMKgIG11dGV4X2xvY2soa2ZkX2dldF9zbWlfbXV0ZXgoKSk7Cj4+ICvCoMKgwqAg
ZGV2LT5zbWlfZXZlbnRzLmV2ZW50cyB8PSBldmVudHM7Cj4+ICvCoMKgwqAgbXV0ZXhfdW5sb2Nr
KGtmZF9nZXRfc21pX211dGV4KCkpOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cj4+
ICsKPj4gK3N0YXRpYyB2b2lkIGFzc2lnbl9maWZvX2xlbih2b2lkKQo+PiArewo+PiArwqDCoMKg
IC8qIFdoZW4gYSBuZXcgZXZlbnQgaXMgYWRkZWQgaW50byBzdXBwb3J0IGFuZCB0aGlzIG5ldyBl
dmVudCBtc2cgCj4+IHVzZXMKPj4gK8KgwqDCoMKgICogbW9yZSBtZW1vcnksIHJlcGxhY2UgdGhl
IG1zZyBzdHJ1Y3QgaGVyZS4KPj4gK8KgwqDCoMKgICovCj4+ICvCoMKgwqAgdWludDMyX3QgbWF4
X21zZyA9IHNpemVvZihzdHJ1Y3QgCj4+IGtmZF9zbWlfbXNnX3ZtZmF1bHQpL3NpemVvZih1aW50
MzJfdCk7Cj4+ICvCoMKgwqAgLyogKzEgZm9yIHRoZSBldmVudCB0eXBlIGluIGZyb250IG9mIGV2
ZW50IG1lc3NhZ2UuIHVwIHRvIDMyIAo+PiBlbnRyaWVzICovCj4+ICvCoMKgwqAgc21pX2ZpZm9f
bGVuID0gKCsrbWF4X21zZykgKiAzMjsKPgo+IFNlZSBhYm92ZS4gVGhpcyBjb3VsZCBiZSBzdGF0
aWNhbGx5IGluaXRpYWxpemVkLgo+Cj4KPj4gK30KPj4gKwo+PiAraW50IGtmZF9zbWlfZXZlbnRf
cmVnaXN0ZXIoc3RydWN0IGtmZF9kZXYgKmRldiwgaW50ICpmZCkKPj4gK3sKPj4gK8KgwqDCoCBp
bnQgcmV0ID0gMDsKPgo+IFRoaXMgZnVuY3Rpb24gc2hvdWxkIHJldHVybiBmYWlsdXJlIGlmIHRo
ZSBldmVudCB3YXMgYWxyZWFkeSAKPiByZWdpc3RlcmVkLiBZb3UgY2FuIG9ubHkgYWxsb3cgb25l
IEZEIHRvIGJlIGNyZWF0ZWQgcGVyIGRldmljZSwgCj4gYmVjYXVzZSB0aGF0IEZEIG93bnMgdGhl
IEZJRk8uCj4KPiBUaGlzIGVudGlyZSBmdW5jdGlvbiBtdXN0IGJlIHVuZGVyIHRoZSBmaWZvIG11
dGV4Lgo+Ck9rCj4KPj4gKwo+PiArwqDCoMKgIGlmICghc21pX2ZpZm9fbGVuKQo+PiArwqDCoMKg
wqDCoMKgwqAgYXNzaWduX2ZpZm9fbGVuKCk7Cj4+ICsKPj4gK8KgwqDCoCByZXQgPSBrZmlmb19h
bGxvYygmZGV2LT5zbWlfZXZlbnRzLmZpZm8sIHNtaV9maWZvX2xlbiwgR0ZQX0tFUk5FTCk7Cj4+
ICvCoMKgwqAgaWYgKHJldCkgewo+PiArwqDCoMKgwqDCoMKgwqAgcHJfZXJyKCJzbWlfZXZlbnQ6
IGZhaWwgdG8gYWxsb2NhdGUga2ZpZm9cbiIpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJl
dDsKPj4gK8KgwqDCoCB9Cj4+ICvCoMKgwqAgaW5pdF93YWl0cXVldWVfaGVhZCgmZGV2LT5zbWlf
ZXZlbnRzLndhaXRfcXVldWUpOwo+PiArwqDCoMKgIGRldi0+c21pX2V2ZW50cy5ldmVudHMgPSAw
Owo+PiArwqDCoMKgIGRldi0+c21pX2V2ZW50cy5yZWdpc3RlcmVkID0gdHJ1ZTsKPj4gKwo+PiAr
wqDCoMKgIHJldCA9IGFub25faW5vZGVfZ2V0ZmQoa2ZkX3NtaV9uYW1lLCAma2ZkX3NtaV9ldl9m
b3BzLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICh2b2lkICopZGV2LCAwKTsK
Pj4gK8KgwqDCoCAqZmQgPSByZXQ7Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gcmV0Owo+PiArfQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3NtaV9ldmVudHMu
aCAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfc21pX2V2ZW50cy5oCj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAuLmUxMGJiNWQKPj4gLS0tIC9kZXYv
bnVsbAo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfc21pX2V2ZW50cy5o
Cj4+IEBAIC0wLDAgKzEsMzEgQEAKPj4gKy8qCj4+ICsgKiBDb3B5cmlnaHQgMjAyMCBBZHZhbmNl
ZCBNaWNybyBEZXZpY2VzLCBJbmMuCj4+ICsgKgo+PiArICogUGVybWlzc2lvbiBpcyBoZXJlYnkg
Z3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gCj4+IG9idGFpbmluZyBhCj4+
ICsgKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBm
aWxlcyAodGhlIAo+PiAiU29mdHdhcmUiKSwKPj4gKyAqIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJl
IHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IAo+PiBsaW1pdGF0aW9uCj4+
ICsgKiB0aGUgcmlnaHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlz
dHJpYnV0ZSwgCj4+IHN1YmxpY2Vuc2UsCj4+ICsgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhl
IFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSAKPj4gdGhlCj4+ICsgKiBT
b2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBj
b25kaXRpb25zOgo+PiArICoKPj4gKyAqIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0
aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIAo+PiBpbmNsdWRlZCBpbgo+PiArICogYWxs
IGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCj4+ICsgKgo+
PiArICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkg
T0YgQU5ZIEtJTkQsIAo+PiBFWFBSRVNTIE9SCj4+ICsgKiBJTVBMSUVELCBJTkNMVURJTkcgQlVU
IE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIAo+PiBNRVJDSEFOVEFCSUxJVFksCj4+
ICsgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5U
LsKgIElOIE5PIAo+PiBFVkVOVCBTSEFMTAo+PiArICogVEhFIENPUFlSSUdIVCBIT0xERVIoUykg
T1IgQVVUSE9SKFMpIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCAKPj4gREFNQUdFUyBPUgo+PiAr
ICogT1RIRVIgTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9S
VCBPUiAKPj4gT1RIRVJXSVNFLAo+PiArICogQVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09O
TkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgCj4+IFVTRSBPUgo+PiArICogT1RIRVIg
REVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgo+PiArICovCj4+ICsKPj4gKyNpZm5kZWYgS0ZEX1NN
SV9FVkVOVFNfSF9JTkNMVURFRAo+PiArI2RlZmluZSBLRkRfU01JX0VWRU5UU19IX0lOQ0xVREVE
Cj4+ICsKPj4gK2ludCBrZmRfc21pX2V2ZW50X3JlZ2lzdGVyKHN0cnVjdCBrZmRfZGV2ICpkZXYs
IGludCAqZmQpOwo+PiAraW50IGtmZF9zbWlfZXZlbnRfZW5hYmxlKHN0cnVjdCBrZmRfZGV2ICpk
ZXYsIHVpbnQ2NF90IGV2ZW50cyk7Cj4+ICtpbnQga2ZkX3NtaV9ldmVudF9kaXNhYmxlKHN0cnVj
dCBrZmRfZGV2ICpkZXYsIHVpbnQ2NF90IGV2ZW50cyk7Cj4+ICt2b2lkIGtmZF9zbWlfZXZlbnRf
dXBkYXRlX3ZtZmF1bHQoc3RydWN0IGtmZF9kZXYgKmRldiwgdWludDE2X3QgcGFzaWQpOwo+PiAr
Cj4+ICsjZW5kaWYKPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwu
aCAKPj4gYi9pbmNsdWRlL3VhcGkvbGludXgva2ZkX2lvY3RsLmgKPj4gaW5kZXggNGY2Njc2NC4u
ZGM5MzA5ZSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2tmZF9pb2N0bC5oCj4+
ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaAo+PiBAQCAtNDQyLDYgKzQ0Miwz
MSBAQCBzdHJ1Y3Qga2ZkX2lvY3RsX2ltcG9ydF9kbWFidWZfYXJncyB7Cj4+IMKgwqDCoMKgwqAg
X191MzIgZG1hYnVmX2ZkO8KgwqDCoCAvKiB0byBLRkQgKi8KPj4gwqAgfTsKPj4gwqAgKy8qCj4+
ICsgKiBLRkQgU01JKFN5c3RlbSBNYW5hZ2VtZW50IEludGVyZmFjZSkgZXZlbnRzCj4+ICsgKi8K
Pj4gK2VudW0ga2ZkX3NtaV9ldmVudHNfb3Agewo+PiArwqDCoMKgIEtGRF9TTUlfRVZFTlRTX1JF
R0lTVEVSID0gMSwKPj4gK8KgwqDCoCBLRkRfU01JX0VWRU5UU19FTkFCTEUsCj4+ICvCoMKgwqAg
S0ZEX1NNSV9FVkVOVFNfRElTQUJMRQo+PiArfTsKPj4gKwo+PiArLyogRXZlbnQgdHlwZSAoZGVm
aW5lZCBieSBiaXRtYXNrKSAqLwo+PiArI2RlZmluZSBLRkRfU01JX0VWRU5UX1ZNRkFVTFTCoMKg
wqDCoCAweDAwMDAwMDAxCj4KPiBTaW5jZSB5b3UgY2FuIG9ubHkgaGF2ZSA2NCBldmVudHMsIHlv
dSBvbmx5IG5lZWQgb25lIGJ5dGUuIFlvdSBoYXZlIAo+IHBsZW50eSBvZiBzcGFjZSBpbiB0aGUg
aGVhZGVyIGR3b3JkIHRvIGFkZCB0aGUgbWVzc2FnZSBzaXplLiBUaGF0IAo+IHdvdWxkIG1ha2Ug
aXQgZWFzaWVyIHRvIHBhcnNlIHRoZSBldmVudHMgYW5kIGFsbG93IHZhcmlhYmxlIHNpemUgCj4g
ZXZlbnRzIGluIHRoZSBmdXR1cmUuIFRoZW4geW91IHNob3VsZCBkZWZpbmUgdGhlIGhlYWRlciBh
cyBhIHN0cnVjdC4gCj4gU29tZXRoaW5nIGxpa2UgdGhpczoKPgo+IHN0cnVjdCBrZmRfc21pX21z
Z19oZWFkZXIgewo+IMKgwqDCoMKgX191OCB0eXBlOwo+IMKgwqDCoMKgX191OCBwYWQ7Cj4gwqDC
oMKgwqBfX3UxNiBzaXplOwo+IH07Cj4KSXQgc291bmRzIGEgZ29vZCBpZGVhLCBidXQgSSBkb24n
dCBzZWUgaG93IGl0IGltcHJvdmVzIHRoZSBwYXJzaW5nLi4uIApUaGUgdXNlciByZWFkcyB0aGUg
Y29udGVudCBiYXNlZCBvbiB0aGUgZXZlbnQgdHlwZS4gTXkgdGVzdCBjb2RlIG9uIHRoZSAKdXNl
ciBzcGFjZSBpcyBsaWtlIHRoaXM6CgpyZWFkKGZkLCAmZXZlbnQsIHNpemVvZih1aW50MzJfdCkp
OyAvL3dpbGwgY2hhbmdlIHVpbnQ2NF90Cgpzd2l0Y2ggKGV2ZW50KSB7CgpjYXNlIGV2ZW50X0E6
CgogwqDCoMKgIHJlYWQoZmQsICZzdHJ1Y3RfZXZlbnRfQV92YXJpYWJsZSwgc2l6ZW9mKHN0cnVj
dCBldmVudF9BKSk7CgpjYXNlIGV2ZW50X0I6CgogwqDCoMKgIHJlYWQoZmQsICZzdHJ1Y3RfZXZl
bnRfQl92YXJpYWJsZSwgc2l6ZW9mKHN0cnVjdCBldmVudF9CKSk7CgpOb3QgZXhhY3RseSBsaWtl
IHRoYXQsIHN1Y2ggYXMgcmVhZCgpIGlzIGRvbmUgaW4gYSBzZXBhcmF0ZSBmdW5jdGlvbiwgCmJ1
dCB5b3Ugc2VlIHRoZSBpZGVhLgoKVGhpcyBpcyB3aGF0IEkgbWVhbiBieSB0aGUgZXZlbnQgdHlw
ZSB0ZWxscyB0aGUgc2l6ZSBpdHNlbGYuIElmIEkgCnByb3ZpZGUgdGhlIGhlYWRlciB5b3Ugc3Vn
Z2VzdGVkLCB0aGUgdXNlciBzdGlsbCBuZWVkcyB0byBkZWNpZGUgd2hpY2ggCnN0cnVjdCB0byB1
c2UuLi4uIFVubGVzcyB3ZSBkb24ndCB1c2Ugc3RydWN0IGZvciB0aGUgbWVzc2FnZS7CoCBJIGNh
biAKY2hhbmdlIHRoZSBvdXRwdXQgdG8gYmVjb21lIGV2ZW50OmRlc2NyaXB0aW9uX29mX3RoZSBl
dmVudCB3aGVyZSAKZGVzY3JpcHRpb24gaXMgYSBzdHJpbmcuIFRoZSBoZWFkZXIgeW91IHN1Z2dl
c3Qgd2lsbCBhcHBseSB0byB0aGlzIAptZXRob2QgcHJldHR5IHdlbGwuCgo+Cj4+ICsKPj4gK3N0
cnVjdCBrZmRfaW9jdGxfc21pX2V2ZW50c19hcmdzIHsKPj4gK8KgwqDCoCBfX3UzMiBvcDvCoMKg
wqDCoMKgwqAgLyogdG8gS0ZEICovCj4+ICvCoMKgwqAgX191MzIgZXZlbnRzO8KgwqAgLyogdG8g
S0ZEICovCj4KPiBJIHRob3VnaHQgdGhpcyBzaG91bGQgYmUgNjQtYml0Lgo+Cj4KPj4gK8KgwqDC
oCBfX3UzMiBncHVfaWQ7wqDCoCAvKiB0byBLRkQgKi8KPj4gK8KgwqDCoCBfX3UzMiBkYXRhO8Kg
wqDCoCAvKiBmcm9tIEtGRCAqLwo+PiArfTsKPj4gKwo+PiArLyogTWVzc2FnZSB0byB1c2VyIHNw
YWNlIGZvciBlYWNoIGV2ZW50ICovCj4+ICtzdHJ1Y3Qga2ZkX3NtaV9tc2dfdm1mYXVsdCB7Cj4K
PiBJZiB5b3UgZGVmaW5lIHRoZSBoZWFkZXIgbGlrZSBzdWdnZXN0ZWQgYWJvdmUsIHlvdSBjb3Vs
ZCBpbmNsdWRlIGl0IAo+IGhlcmUgYW5kIGF0IHRoZSBzdGFydCBvZiBhbGwgbWVzc2FnZSBzdHJ1
Y3R1cmVzLiBNaWdodCBzaW1wbGlmeSB0aGUgCj4gY29kZSBhIGxpdHRsZToKPgo+IMKgwqDCoMKg
c3RydWN0IGtmZF9zbWlfbXNnX2hlYWRlciBoZWFkZXI7Cj4KPiBSZWdhcmRzLAo+IMKgIEZlbGl4
Cj4KPj4gK8KgwqDCoCB1aW50MzJfdCBwaWQ7Cj4+ICvCoMKgwqAgY2hhciB0YXNrX25hbWVbMTZd
Owo+PiArfTsKPj4gKwo+PiDCoCAvKiBSZWdpc3RlciBvZmZzZXQgaW5zaWRlIHRoZSByZW1hcHBl
ZCBtbWlvIHBhZ2UKPj4gwqDCoCAqLwo+PiDCoCBlbnVtIGtmZF9tbWlvX3JlbWFwIHsKPj4gQEAg
LTU0Niw3ICs1NzEsMTAgQEAgZW51bSBrZmRfbW1pb19yZW1hcCB7Cj4+IMKgICNkZWZpbmUgQU1E
S0ZEX0lPQ19BTExPQ19RVUVVRV9HV1PCoMKgwqDCoMKgwqDCoCBcCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBBTURLRkRfSU9XUigweDFFLCBzdHJ1Y3Qga2ZkX2lvY3RsX2FsbG9jX3F1ZXVlX2d3c19h
cmdzKQo+PiDCoCArI2RlZmluZSBBTURLRkRfSU9DX1NNSV9FVkVOVFPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFwKPj4gK8KgwqDCoMKgwqDCoMKgIEFNREtGRF9JT1dSKDB4MUYsIHN0cnVjdCBrZmRf
aW9jdGxfc21pX2V2ZW50c19hcmdzKQo+PiArCj4+IMKgICNkZWZpbmUgQU1ES0ZEX0NPTU1BTkRf
U1RBUlTCoMKgwqDCoMKgwqDCoCAweDAxCj4+IC0jZGVmaW5lIEFNREtGRF9DT01NQU5EX0VORMKg
wqDCoMKgwqDCoMKgIDB4MUYKPj4gKyNkZWZpbmUgQU1ES0ZEX0NPTU1BTkRfRU5EwqDCoMKgwqDC
oMKgwqAgMHgyMAo+PiDCoCDCoCAjZW5kaWYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4Cg==
