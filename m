Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D10E3B1616
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Jun 2021 10:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CC06E88E;
	Wed, 23 Jun 2021 08:43:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2049.outbound.protection.outlook.com [40.107.96.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465EF6E88E
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Jun 2021 08:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSxeTODgYUp2xYfInIHZ3ZK1pKrND4z7vCjZxOCvsyv4Qs9flWr1Vn01DcyR0pe4uNEVNzl3MN1c9vcTc/fWgTIZ5/nzQ1AekczOOj0PWlnhATByiS9ZbzwC1QigeUu5c55oV0K1LaE9i/kVZfYf4iHuLmKlI1Hc0X9D95qSmASY1dKKQgspSPwr6YunEn4LD58KcujBacD2M+Wq/JI/TvyMsNR+USjnDu7Uls6VJhySuSPZGs6R4nW2C33gGyficpGfMOBIY3eGPceXk/4CVMzXblNFaWy/H8T02mNOXo1I05E1hfZ/iKTYyNrI0bpdX6YMCp6Ixxgad10ljbhGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIJspxVkhZYwGmey8Ctb1Gc83kDYQ9iK6hGtn3pq1SE=;
 b=oTCTxlMxCO0fE9Aqvb0fU6GnC60MEV215RRoWd2sHpHBBIJ5nru/c6l/DvmF8a78SYlX/PB6wTzoMdElMmSB5qBTo6vG0Imvf/MyGE8Y22mm8HHyAXoOomR7qIrtmzvXK9guCGLblSXmbYMRCOX0QW1tjYASVQ2FRVBzR1j4YMcMlHi2ixhkpZ+Ez8hdA5IT/8XtxIUiGqpmqPPkXyc4E4b53ZEBHVYtix7n9yPSF3Q5TgamA7CKMnWAWGdGcxE04VlR9zFwlbHgbGek37Tbz97ovnbalq8seUOBAEiNPaevQR4E0pwrbu+peKbhQyf4nZ9hPI6UsdY898CgB3R2zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIJspxVkhZYwGmey8Ctb1Gc83kDYQ9iK6hGtn3pq1SE=;
 b=2rN+axuhFeQOyORz5YtqRNvzRcQ3D6wXNt8veU1vAL5sR9yk5tIjVxXkLKAoaEDaCcyBbgFNZ8cVUusjbGe+CqlWTZ0PbqsdjbD8iDB2UuDb6Qj9ZksdYj37IW+heznYQRx3tWkLTFxpTJwwrBur3oQ6EJ3LOjIT4mJV79fFqGk=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM8PR12MB5432.namprd12.prod.outlook.com (2603:10b6:8:32::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 08:43:18 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68%4]) with mapi id 15.20.4264.019; Wed, 23 Jun 2021
 08:43:18 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: cleanup pasid handling
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20210623075627.14797-1-nirmoy.das@amd.com>
 <55afea58-fb31-12c7-26bb-051dd8ccd5fa@amd.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <c06a1fb6-b627-f90c-a071-49e7786829a2@amd.com>
Date: Wed, 23 Jun 2021 10:43:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <55afea58-fb31-12c7-26bb-051dd8ccd5fa@amd.com>
Content-Language: en-US
X-Originating-IP: [2003:c5:8f23:b700:d4fe:9bbc:8e11:929b]
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f23:b700:d4fe:9bbc:8e11:929b]
 (2003:c5:8f23:b700:d4fe:9bbc:8e11:929b) by
 FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Wed, 23 Jun 2021 08:43:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36eae8a9-e43f-4493-c9d2-08d93622f2ef
X-MS-TrafficTypeDiagnostic: DM8PR12MB5432:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB5432F31D2EFD3219D800B6468B089@DM8PR12MB5432.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zKXiE/Y7CjoCh2XATktcLSIVasoRc49kbjdwIMeZJZDSPJI2TS18+x8MoLK8VrvvcaXoNM/hnRdbz20DJYOSwvXblLo7G44JdUnarWdQL7suESXUFp4AgEbJGxrQBBczUu4W0eTwG5p1CyseDzn7engyWwwnCOmKqdgHdfKsHarIF1E6Li12HLeZkIE1YsHa1PC9FoJ/J3q1Z65loWKv1qE8b4lweu3t2Ceh9plXj1Ko3DU95wznK8WycY1RsBtC139tffHdJuMKI/XJEwrV5RMBQfdWnNO2XFO+Hfv5PRRYCdx+jxFHZjrc6S1v5MjsuKOrfhnLqXBfIyfFcXrqFJUWIfkeq8Fm+ZVr0WxE4xRsKyjoKqbOekXuNOdbMDVTZlDTU0YwBM3KXfFpm0AL+zkkfekIyc8Oi0dy8xnnGCtJVxJnhexHHNFr8Jn+93iaXjfTZeqV4NRY4szu24fnUcrHiYRoQ7haUPI9UeBAOB7Q9YNGOvm43J0lgqvWwlHFEokhepbjVpJp5LaxLJOfhvcfCFdidJt+MI2b3IwX3ZKTXoV59GA/dCJBkq77050EgbANMM6sy03Nmb1h3J+Tp0Rvbtdv9fqRSFUFfmuCzqiMYAKmNoQchBeSOY7xrSWVs5RvapSzAcJKkVOJ48wrV8yt55otNc/nFCuWRsdXXq5S7sYZlWh8HUp56yvGk7vq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(316002)(31696002)(4326008)(83380400001)(53546011)(36756003)(6486002)(66556008)(66476007)(38100700002)(66946007)(5660300002)(31686004)(86362001)(6666004)(2616005)(66574015)(8936002)(16526019)(186003)(2906002)(52116002)(478600001)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akZsc1V1OXdFUnVwZ3RlcXdsNnJjQTlsK3NQNzE1amNnK0JvWVNENHh0N0I1?=
 =?utf-8?B?dzdrUlhna0dvY08xQnpmU1hWL1JJdGozVkdELzB5R0lFSXVXdEhJZDdDUXFu?=
 =?utf-8?B?N0c5V0JPbkc4MXJqQlZra2o2b1YxM0JVbkp3RVFSQy94WWdsSzBSMXRxV2Q4?=
 =?utf-8?B?ZE53NDhJbU96bDhFcFVIdTcwR01SMDUyUGp6MkJVOWpDa3NtemRuTUtTT05o?=
 =?utf-8?B?Z042YUR3eUptbzRRZkpnSzc1SFZFQWpFQXZzRUNlMnV1OW1hNlV1eGxTOVEz?=
 =?utf-8?B?YXhNdGd1d0NFT0hJaHNhbzExa1JMbEEyNTcybHJ5NmV0aFlQaWYyT0ZxV0lD?=
 =?utf-8?B?MDAwc01ZSEJycEFxRTFCQjJ1MzNMd0kreHU3Q25Rb3RNdWVmNEgrNDQ2dHBI?=
 =?utf-8?B?STNrdHJYL3JobVhETzZDbFA5WEhYT1I3NFA0TFgyMlFYZUtjK1RGQldncWVD?=
 =?utf-8?B?NUV0cUFVcTFlU1lHU3l4clZIekZZT3JHTmovbTNoa3BiSUpuYWtxUDl0aUt5?=
 =?utf-8?B?clkzeWlVYXF4VjNTSjFFanRFUlNEZUZneTIxYW9hQU5OcHlhTWwwRUk5QUJW?=
 =?utf-8?B?RXUzN2poZHFDdVZYdGlJZ2p0SFNuaXdlcHdrRGNSQnY2M1pVVDFyNnVUMGRn?=
 =?utf-8?B?bDJOZVJSTmtneTV4bHJhTmhPeXF6VnhlZXZ3MGZSWXMzZUZ4WFRkOFpmWDMx?=
 =?utf-8?B?c1FjS3l0aTJIOW02ZW9jdHVDK1NqOWhUK1d4dERXQjJ2ZVZRSEtBQmVZcVM1?=
 =?utf-8?B?WUZRQllPSlRsVnJqVCtsNExxZGxNejZGZm1OanFINDFxUUVWcWdmR1NLY21Q?=
 =?utf-8?B?V3IyNWhlSnp5V2w3VWdpRHl1dTVDbzJuQ0p5OUlBdktEb28rUjBIUXlWR3Q0?=
 =?utf-8?B?aUp5MkFVN1l5djQvb2pyTjZBOUIvUjRzV1VZYXhtbHExbG9obExiSXlGNXZC?=
 =?utf-8?B?L1NVS0ZXZGtrbE9wcEVhSnkwb0VaL2hrOElzaWxqQVZwZFNSTnh6K1lGSFcw?=
 =?utf-8?B?Z3I4ZFdiUWE2T1U5SHBsQU9YbE1aSHh6NGN3RHBwU24xMzFiaHhZMFIrdlZQ?=
 =?utf-8?B?d3phazNZOVJRY2lmUXFFRi90emZjckYzR2hhRHZualB5cHBHZzdrVjdUdXVY?=
 =?utf-8?B?czJ1bWxVRWU0THNJeFhPaUNxaW9vMVZCY0p4bzE2MGppMjBVRDFta2J5OUM1?=
 =?utf-8?B?VlpKa3k3NEJxSXdOR3R6M3RSNnBFdlJodnhLaWNpdE9KcXo4ZmpibEZsbWVB?=
 =?utf-8?B?NkdDV3R6dmR0ZFdKMzBnSFJGdFhWNVBrSXZnbTZpQ0ZCakVVVWR2ZmwwZXhJ?=
 =?utf-8?B?ZmNYaU9GZTREaytLZzB4SFpvUDZGQ1pqZ0ZBb3NJWTNOTVBBL0lFbEFMeWhq?=
 =?utf-8?B?MEpSQ0FrL2FKbWNWbEdzZ2gwNS9MTmNmcXVNSFA4S2tvbGhPYmVuUkN5S21M?=
 =?utf-8?B?anBSTFNVM1o3ZXN6cjhieXEreG5ibUJYTWZhMkZQSWFRdDZPUDhtS2hyM0Zo?=
 =?utf-8?B?emYxRVNwYm9naGgwaFpheHM5d2JZV0tFS09pZEwwNThmeFhuNzF0UTRORk9q?=
 =?utf-8?B?bnFyT1p0QkVkeWEvRlFySWpZT2ppQTNiUWFFc20wcFJZdWJIcS9KK3ZzYnY1?=
 =?utf-8?B?SzBtSUppZUlYajBKRk9ZNlFnQjlvak9IU0Yrai9JSE8ydDdSZ1FPQWhQYUVW?=
 =?utf-8?B?blk2REN0dWl4YjBxUHZ2MFhzZEI2RFZ5YXhZNU9NK29hejBRMUNCWEZ4alhN?=
 =?utf-8?B?ZDRLNmhhSk1rbUYvcGtzOUN5djY3M1JvVnlEM1RDZ2J4dWJZSmhBUUhIZndk?=
 =?utf-8?B?bUtjbU5TT05tejdlZkFEOTJuWmp4NDhKZjRldUxya3ZWaFE4RTZlaEx5K3h4?=
 =?utf-8?Q?Jijb4d3cP6AOF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36eae8a9-e43f-4493-c9d2-08d93622f2ef
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 08:43:18.3409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: host6cdJYHabMQyMU7AgbjI5BYyP+3Sbx5/jMaI7RKUmhrpXP1fUmJn9k7V14bkyk6pamqnUK8e1nF8IBfEPhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5432
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
Cc: Felix.Kuehling@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDYvMjMvMjAyMSAxMDoyMyBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAyMy4w
Ni4yMSB1bSAwOTo1NiBzY2hyaWViIE5pcm1veSBEYXM6Cj4+IENsZWFudXAgY29kZSByZWxhdGVk
IHRvIHZtIHBhc2lkIGJ5IGFkZGluZyBoZWxwZXIgZnVuY3Rpb25zLgo+PiBBbHNvIHJlcGxhY2Ug
aWRyIHdpdGggeGFycmF5IGFzIHdlIGFjdHVhbGx5IG5lZWQgaGFzaCBmdW5jdGlvbmFsaXR5Lgo+
Cj4gVGhhdCBsb29rcyBxdWl0ZSBhIGJpdCBiZXR0ZXIgdGhhbiBiZWZvcmUsIGJ1dCBJIHRoaW5r
IHdlIHNob3VsZCAKPiBhcHByb2FjaCBpdCBkaWZmZXJlbnRseS4KPgo+IEZpcnN0IG9mIGFsbCBt
YWtlIGEgcGF0Y2ggd2hpY2ggbW92ZXMgYW1kZ3B1X3Bhc2lkX2ZyZWUoKSBvdXRzaWRlIG9mIAo+
IHRoZSBWTSBjb2RlLgo+Cj4gV2UgZG9uJ3QgYWxsb2NhdGUgdGhlIHBhc2lkIGluc2lkZSB0aGUg
Vk0gY29kZSBmb3IgZ29vZCByZWFzb25zIHNvIHdlIAo+IHNob3VsZG4ndCBmcmVlIGl0IGVpdGhl
ci4KPgo+IFRoZW4gaW4gYSBzZWNvbmQgcGF0Y2ggbWFrZSBhIGZ1bmN0aW9uIGFtZGdwdV92bV9z
ZXRfcGFzaWQoYWRldiwgdm0sIAo+IHBhc2lkKTsKPgo+IFdoZW4gdGhlIHBhc2lkIGlzIHplcm8g
d2UgcmVtb3ZlIHRoZSBWTSBmcm9tIHRoZSB4YXJyYXksIG90aGVyd2lzZSB3ZSAKPiB1cGRhdGUg
dGhlIGVudHJ5LgoKClRoYW5rcywgd2lsbCBkbyB0aGF0LgoKCk5pcm1veQoKPgo+IFRoYW5rcywK
PiBDaHJpc3RpYW4uCj4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRh
c0BhbWQuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZtLmMgfCAxMzAgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+PiDCoCBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaCB8wqDCoCAzICstCj4+IMKgIDIgZmlsZXMgY2hhbmdl
ZCwgNjIgaW5zZXJ0aW9ucygrKSwgNzEgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyAKPj4gYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+PiBpbmRleCA2Mzk3NWJkYThlNzYuLmFiYmExZTJk
ZTI2NCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zt
LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPj4gQEAg
LTg3LDYgKzg3LDQ1IEBAIHN0cnVjdCBhbWRncHVfcHJ0X2NiIHsKPj4gwqDCoMKgwqDCoCBzdHJ1
Y3QgZG1hX2ZlbmNlX2NiIGNiOwo+PiDCoCB9Owo+PiDCoCArc3RhdGljIGludCBhbWRncHVfdm1f
cGFzaWRfaW5zZXJ0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBwYXNpZCwKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50ICp2bV9wYXNpZCkKPj4g
K3sKPj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+PiArwqDCoMKgIGludCByOwo+PiAr
Cj4+ICvCoMKgwqAgaWYgKCFwYXNpZCkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiAr
Cj4+ICvCoMKgwqAgeGFfbG9ja19pcnFzYXZlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkcywgZmxh
Z3MpOwo+PiArwqDCoMKgIHIgPSB4YV9lcnIoX194YV9zdG9yZSgmYWRldi0+dm1fbWFuYWdlci5w
YXNpZHMsIHBhc2lkLCB2bSwgCj4+IEdGUF9BVE9NSUMpKTsKPj4gK8KgwqDCoCB4YV91bmxvY2tf
aXJxcmVzdG9yZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZHMsIGZsYWdzKTsKPj4gK8KgwqDCoCBp
ZiAociA8IDApCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcjsKPj4gK8KgwqDCoCBpZiAodm1f
cGFzaWQpCj4+ICvCoMKgwqDCoMKgwqDCoCAqdm1fcGFzaWQgPSBwYXNpZDsKPj4gKwo+PiArwqDC
oMKgIHJldHVybiAwOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgdm9pZCBhbWRncHVfdm1fcGFzaWRf
cmVtb3ZlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgcGFzaWQsCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50ICp2bV9wYXNpZCkKPj4gK3sKPj4g
K8KgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+PiArCj4+ICvCoMKgwqAgaWYgKCFwYXNpZCkK
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gKwo+PiArwqDCoMKgIHhhX2xvY2tfaXJxc2F2
ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZHMsIGZsYWdzKTsKPj4gK8KgwqDCoCBfX3hhX2VyYXNl
KCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkcywgcGFzaWQpOwo+PiArwqDCoMKgIHhhX3VubG9ja19p
cnFyZXN0b3JlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkcywgZmxhZ3MpOwo+PiArCj4+ICvCoMKg
wqAgaWYgKHZtX3Bhc2lkKQo+PiArwqDCoMKgwqDCoMKgwqAgKnZtX3Bhc2lkID0gMDsKPj4gK30K
Pj4gKwo+PiDCoCAvKgo+PiDCoMKgICogdm0gZXZpY3Rpb25fbG9jayBjYW4gYmUgdGFrZW4gaW4g
TU1VIG5vdGlmaWVycy4gTWFrZSBzdXJlIG5vIAo+PiByZWNsYWltLUZTCj4+IMKgwqAgKiBoYXBw
ZW5zIHdoaWxlIGhvbGRpbmcgdGhpcyBsb2NrIGFueXdoZXJlIHRvIHByZXZlbnQgZGVhZGxvY2tz
IHdoZW4KPj4gQEAgLTI5NDAsMTggKzI5NzksOSBAQCBpbnQgYW1kZ3B1X3ZtX2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIAo+PiBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwgdTMyIHBhc2lk
KQo+PiDCoCDCoMKgwqDCoMKgIGFtZGdwdV9ib191bnJlc2VydmUodm0tPnJvb3QuYm8pOwo+PiDC
oCAtwqDCoMKgIGlmIChwYXNpZCkgewo+PiAtwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBm
bGFnczsKPj4gLQo+PiAtwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnZt
X21hbmFnZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+PiAtwqDCoMKgwqDCoMKgwqAgciA9IGlkcl9h
bGxvYygmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9pZHIsIHZtLCBwYXNpZCwgcGFzaWQgCj4+ICsg
MSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0FUT01JQyk7Cj4+
IC0gc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2NrLCBm
bGFncyk7Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAociA8IDApCj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGdvdG8gZXJyb3JfZnJlZV9yb290Owo+PiAtCj4+IC3CoMKgwqDCoMKgwqDCoCB2bS0+
cGFzaWQgPSBwYXNpZDsKPj4gLcKgwqDCoCB9Cj4+ICvCoMKgwqAgciA9IGFtZGdwdV92bV9wYXNp
ZF9pbnNlcnQoYWRldiwgdm0sIHBhc2lkLCAmdm0tPnBhc2lkKTsKPj4gK8KgwqDCoCBpZiAocikK
Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyb3JfZnJlZV9yb290Owo+PiDCoCDCoMKgwqDCoMKg
IElOSVRfS0ZJRk8odm0tPmZhdWx0cyk7Cj4+IMKgIEBAIC0zMDM4LDE5ICszMDY4LDkgQEAgaW50
IGFtZGdwdV92bV9tYWtlX2NvbXB1dGUoc3RydWN0IAo+PiBhbWRncHVfZGV2aWNlICphZGV2LCBz
dHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKPj4gwqDCoMKgwqDCoCByID0gYW1kZ3B1X3ZtX2NoZWNrX2Ns
ZWFuX3Jlc2VydmVkKGFkZXYsIHZtKTsKPj4gwqDCoMKgwqDCoCBpZiAocikKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGdvdG8gdW5yZXNlcnZlX2JvOwo+PiAtCj4+IC3CoMKgwqAgaWYgKHBhc2lkKSB7
Cj4+IC3CoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+PiAtCj4+IC3CoMKgwqDC
oMKgwqDCoCBzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2NrLCBm
bGFncyk7Cj4+IC3CoMKgwqDCoMKgwqDCoCByID0gaWRyX2FsbG9jKCZhZGV2LT52bV9tYW5hZ2Vy
LnBhc2lkX2lkciwgdm0sIHBhc2lkLCBwYXNpZCAKPj4gKyAxLAo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfQVRPTUlDKTsKPj4gLSBzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2ssIGZsYWdzKTsKPj4gLQo+PiAtwqDCoMKg
wqDCoMKgwqAgaWYgKHIgPT0gLUVOT1NQQykKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290
byB1bnJlc2VydmVfYm87Cj4+IC3CoMKgwqDCoMKgwqDCoCByID0gMDsKPj4gLcKgwqDCoCB9Cj4+
ICvCoMKgwqAgciA9IGFtZGdwdV92bV9wYXNpZF9pbnNlcnQoYWRldiwgdm0sIHBhc2lkLCBOVUxM
KTsKPj4gK8KgwqDCoCBpZiAocikKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gdW5yZXNlcnZlX2Jv
Owo+PiDCoCDCoMKgwqDCoMKgIC8qIENoZWNrIGlmIFBEIG5lZWRzIHRvIGJlIHJlaW5pdGlhbGl6
ZWQgYW5kIGRvIGl0IGJlZm9yZQo+PiDCoMKgwqDCoMKgwqAgKiBjaGFuZ2luZyBhbnkgb3RoZXIg
c3RhdGUsIGluIGNhc2UgaXQgZmFpbHMuCj4+IEBAIC0zMDg5LDM1ICszMTA5LDIzIEBAIGludCBh
bWRncHVfdm1fbWFrZV9jb21wdXRlKHN0cnVjdCAKPj4gYW1kZ3B1X2RldmljZSAqYWRldiwgc3Ry
dWN0IGFtZGdwdV92bSAqdm0sCj4+IMKgwqDCoMKgwqAgdm0tPmlzX2NvbXB1dGVfY29udGV4dCA9
IHRydWU7Cj4+IMKgIMKgwqDCoMKgwqAgaWYgKHZtLT5wYXNpZCkgewo+PiAtwqDCoMKgwqDCoMKg
wqAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4gLQo+PiAtwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2Nr
X2lycXNhdmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+PiAtwqDCoMKg
wqDCoMKgwqAgaWRyX3JlbW92ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9pZHIsIHZtLT5wYXNp
ZCk7Cj4+IC0gc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9s
b2NrLCBmbGFncyk7Cj4+IC0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIC8qIEZyZWUgdGhlIG9yaWdp
bmFsIGFtZGdwdSBhbGxvY2F0ZWQgcGFzaWQKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBXaWxs
IGJlIHJlcGxhY2VkIHdpdGgga2ZkIGFsbG9jYXRlZCBwYXNpZAo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqLwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X3Bhc2lkX2ZyZWUodm0tPnBhc2lk
KTsKPj4gLcKgwqDCoMKgwqDCoMKgIHZtLT5wYXNpZCA9IDA7Cj4+ICvCoMKgwqDCoMKgwqDCoCBh
bWRncHVfdm1fcGFzaWRfcmVtb3ZlKGFkZXYsIHZtLT5wYXNpZCwgJnZtLT5wYXNpZCk7Cj4+IMKg
wqDCoMKgwqAgfQo+PiDCoCDCoMKgwqDCoMKgIC8qIEZyZWUgdGhlIHNoYWRvdyBibyBmb3IgY29t
cHV0ZSBWTSAqLwo+PiBhbWRncHVfYm9fdW5yZWYoJnRvX2FtZGdwdV9ib192bSh2bS0+cm9vdC5i
byktPnNoYWRvdyk7Cj4+IC0KPj4gwqDCoMKgwqDCoCBpZiAocGFzaWQpCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCB2bS0+cGFzaWQgPSBwYXNpZDsKPj4gwqAgwqDCoMKgwqDCoCBnb3RvIHVucmVzZXJ2
ZV9ibzsKPj4gwqAgwqAgZnJlZV9pZHI6Cj4+IC3CoMKgwqAgaWYgKHBhc2lkKSB7Cj4+IC3CoMKg
wqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+PiArwqDCoMKgIGFtZGdwdV92bV9wYXNp
ZF9yZW1vdmUoYWRldiwgcGFzaWQsIE5VTEwpOwo+PiDCoCAtIHNwaW5fbG9ja19pcnFzYXZlKCZh
ZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2ssIGZsYWdzKTsKPj4gLcKgwqDCoMKgwqDCoMKgIGlk
cl9yZW1vdmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfaWRyLCBwYXNpZCk7Cj4+IC0gc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2NrLCBmbGFncyk7Cj4+
IC3CoMKgwqAgfQo+PiDCoCB1bnJlc2VydmVfYm86Cj4+IMKgwqDCoMKgwqAgYW1kZ3B1X2JvX3Vu
cmVzZXJ2ZSh2bS0+cm9vdC5ibyk7Cj4+IMKgwqDCoMKgwqAgcmV0dXJuIHI7Cj4+IEBAIC0zMTMz
LDE0ICszMTQxLDcgQEAgaW50IGFtZGdwdV92bV9tYWtlX2NvbXB1dGUoc3RydWN0IAo+PiBhbWRn
cHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKPj4gwqDCoCAqLwo+PiDCoCB2
b2lkIGFtZGdwdV92bV9yZWxlYXNlX2NvbXB1dGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IHN0cnVjdCAKPj4gYW1kZ3B1X3ZtICp2bSkKPj4gwqAgewo+PiAtwqDCoMKgIGlmICh2bS0+cGFz
aWQpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+IC0KPj4gLcKg
wqDCoMKgwqDCoMKgIHNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xv
Y2ssIGZsYWdzKTsKPj4gLcKgwqDCoMKgwqDCoMKgIGlkcl9yZW1vdmUoJmFkZXYtPnZtX21hbmFn
ZXIucGFzaWRfaWRyLCB2bS0+cGFzaWQpOwo+PiAtIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFk
ZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+PiAtwqDCoMKgIH0KPj4gLcKgwqDC
oCB2bS0+cGFzaWQgPSAwOwo+PiArwqDCoMKgIGFtZGdwdV92bV9wYXNpZF9yZW1vdmUoYWRldiwg
dm0tPnBhc2lkLCAmdm0tPnBhc2lkKTsKPj4gwqDCoMKgwqDCoCB2bS0+aXNfY29tcHV0ZV9jb250
ZXh0ID0gZmFsc2U7Cj4+IMKgIH0KPj4gwqAgQEAgLTMxNjQsMTUgKzMxNjUsNyBAQCB2b2lkIGFt
ZGdwdV92bV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlIAo+PiAqYWRldiwgc3RydWN0IGFtZGdw
dV92bSAqdm0pCj4+IMKgIMKgwqDCoMKgwqAgcm9vdCA9IGFtZGdwdV9ib19yZWYodm0tPnJvb3Qu
Ym8pOwo+PiDCoMKgwqDCoMKgIGFtZGdwdV9ib19yZXNlcnZlKHJvb3QsIHRydWUpOwo+PiAtwqDC
oMKgIGlmICh2bS0+cGFzaWQpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxh
Z3M7Cj4+IC0KPj4gLcKgwqDCoMKgwqDCoMKgIHNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT52bV9t
YW5hZ2VyLnBhc2lkX2xvY2ssIGZsYWdzKTsKPj4gLcKgwqDCoMKgwqDCoMKgIGlkcl9yZW1vdmUo
JmFkZXYtPnZtX21hbmFnZXIucGFzaWRfaWRyLCB2bS0+cGFzaWQpOwo+PiAtIHNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+PiAtwqDC
oMKgwqDCoMKgwqAgdm0tPnBhc2lkID0gMDsKPj4gLcKgwqDCoCB9Cj4+IC0KPj4gK8KgwqDCoCBh
bWRncHVfdm1fcGFzaWRfcmVtb3ZlKGFkZXYsIHZtLT5wYXNpZCwgJnZtLT5wYXNpZCk7Cj4+IMKg
wqDCoMKgwqAgZG1hX2ZlbmNlX3dhaXQodm0tPmxhc3RfdW5sb2NrZWQsIGZhbHNlKTsKPj4gwqDC
oMKgwqDCoCBkbWFfZmVuY2VfcHV0KHZtLT5sYXN0X3VubG9ja2VkKTsKPj4gwqAgQEAgLTMyNTQs
OCArMzI0Nyw3IEBAIHZvaWQgYW1kZ3B1X3ZtX21hbmFnZXJfaW5pdChzdHJ1Y3QgCj4+IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCj4+IMKgwqDCoMKgwqAgYWRldi0+dm1fbWFuYWdlci52bV91cGRhdGVf
bW9kZSA9IDA7Cj4+IMKgICNlbmRpZgo+PiDCoCAtwqDCoMKgIGlkcl9pbml0KCZhZGV2LT52bV9t
YW5hZ2VyLnBhc2lkX2lkcik7Cj4+IC3CoMKgwqAgc3Bpbl9sb2NrX2luaXQoJmFkZXYtPnZtX21h
bmFnZXIucGFzaWRfbG9jayk7Cj4+ICvCoMKgwqAgeGFfaW5pdF9mbGFncygmYWRldi0+dm1fbWFu
YWdlci5wYXNpZHMsIFhBX0ZMQUdTX0xPQ0tfSVJRKTsKPj4gwqAgfQo+PiDCoCDCoCAvKioKPj4g
QEAgLTMyNjcsOCArMzI1OSw4IEBAIHZvaWQgYW1kZ3B1X3ZtX21hbmFnZXJfaW5pdChzdHJ1Y3Qg
Cj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+IMKgwqAgKi8KPj4gwqAgdm9pZCBhbWRncHVfdm1f
bWFuYWdlcl9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+PiDCoCB7Cj4+IC3CoMKg
wqAgV0FSTl9PTighaWRyX2lzX2VtcHR5KCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2lkcikpOwo+
PiAtwqDCoMKgIGlkcl9kZXN0cm95KCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2lkcik7Cj4+ICvC
oMKgwqAgV0FSTl9PTigheGFfZW1wdHkoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRzKSk7Cj4+ICvC
oMKgwqAgeGFfZGVzdHJveSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZHMpOwo+PiDCoCDCoMKgwqDC
oMKgIGFtZGdwdV92bWlkX21ncl9maW5pKGFkZXYpOwo+PiDCoCB9Cj4+IEBAIC0zMzM3LDEzICsz
MzI5LDEzIEBAIHZvaWQgYW1kZ3B1X3ZtX2dldF90YXNrX2luZm8oc3RydWN0IAo+PiBhbWRncHVf
ZGV2aWNlICphZGV2LCB1MzIgcGFzaWQsCj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV92bSAq
dm07Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4gwqAgLcKgwqDCoCBzcGlu
X2xvY2tfaXJxc2F2ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2NrLCBmbGFncyk7Cj4+ICvC
oMKgwqAgeGFfbG9ja19pcnFzYXZlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkcywgZmxhZ3MpOwo+
PiDCoCAtwqDCoMKgIHZtID0gaWRyX2ZpbmQoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfaWRyLCBw
YXNpZCk7Cj4+ICvCoMKgwqAgdm0gPSB4YV9sb2FkKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkcywg
cGFzaWQpOwo+PiDCoMKgwqDCoMKgIGlmICh2bSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgICp0YXNr
X2luZm8gPSB2bS0+dGFza19pbmZvOwo+PiDCoCAtIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFk
ZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+PiArwqDCoMKgIHhhX3VubG9ja19p
cnFyZXN0b3JlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkcywgZmxhZ3MpOwo+PiDCoCB9Cj4+IMKg
IMKgIC8qKgo+PiBAQCAtMzM4NSwxNSArMzM3NywxNSBAQCBib29sIGFtZGdwdV92bV9oYW5kbGVf
ZmF1bHQoc3RydWN0IAo+PiBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgcGFzaWQsCj4+IMKgwqDC
oMKgwqAgc3RydWN0IGFtZGdwdV92bSAqdm07Cj4+IMKgwqDCoMKgwqAgaW50IHI7Cj4+IMKgIC3C
oMKgwqAgc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgaXJx
ZmxhZ3MpOwo+PiAtwqDCoMKgIHZtID0gaWRyX2ZpbmQoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRf
aWRyLCBwYXNpZCk7Cj4+ICvCoMKgwqAgeGFfbG9ja19pcnFzYXZlKCZhZGV2LT52bV9tYW5hZ2Vy
LnBhc2lkcywgaXJxZmxhZ3MpOwo+PiArwqDCoMKgIHZtID0geGFfbG9hZCgmYWRldi0+dm1fbWFu
YWdlci5wYXNpZHMsIHBhc2lkKTsKPj4gwqDCoMKgwqDCoCBpZiAodm0pIHsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJvb3QgPSBhbWRncHVfYm9fcmVmKHZtLT5yb290LmJvKTsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGlzX2NvbXB1dGVfY29udGV4dCA9IHZtLT5pc19jb21wdXRlX2NvbnRleHQ7Cj4+
IMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJvb3QgPSBOVUxMOwo+
PiDCoMKgwqDCoMKgIH0KPj4gLcKgwqDCoCBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT52
bV9tYW5hZ2VyLnBhc2lkX2xvY2ssIGlycWZsYWdzKTsKPj4gK8KgwqDCoCB4YV91bmxvY2tfaXJx
cmVzdG9yZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZHMsIGlycWZsYWdzKTsKPj4gwqAgwqDCoMKg
wqDCoCBpZiAoIXJvb3QpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4+IEBA
IC0zNDExLDExICszNDAzLDExIEBAIGJvb2wgYW1kZ3B1X3ZtX2hhbmRsZV9mYXVsdChzdHJ1Y3Qg
Cj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMiBwYXNpZCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGdvdG8gZXJyb3JfdW5yZWY7Cj4+IMKgIMKgwqDCoMKgwqAgLyogRG91YmxlIGNoZWNrIHRoYXQg
dGhlIFZNIHN0aWxsIGV4aXN0cyAqLwo+PiAtwqDCoMKgIHNwaW5fbG9ja19pcnFzYXZlKCZhZGV2
LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2ssIGlycWZsYWdzKTsKPj4gLcKgwqDCoCB2bSA9IGlkcl9m
aW5kKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2lkciwgcGFzaWQpOwo+PiArwqDCoMKgIHhhX2xv
Y2tfaXJxc2F2ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZHMsIGlycWZsYWdzKTsKPj4gK8KgwqDC
oCB2bSA9IHhhX2xvYWQoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRzLCBwYXNpZCk7Cj4+IMKgwqDC
oMKgwqAgaWYgKHZtICYmIHZtLT5yb290LmJvICE9IHJvb3QpCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCB2bSA9IE5VTEw7Cj4+IC3CoMKgwqAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+dm1f
bWFuYWdlci5wYXNpZF9sb2NrLCBpcnFmbGFncyk7Cj4+ICvCoMKgwqAgeGFfdW5sb2NrX2lycXJl
c3RvcmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRzLCBpcnFmbGFncyk7Cj4+IMKgwqDCoMKgwqAg
aWYgKCF2bSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyb3JfdW5sb2NrOwo+PiDCoCBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggCj4+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgKPj4gaW5kZXggZGRiODVhODVj
YmJhLi4zMWM0Njc3NjQxNjIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92bS5oCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5oCj4+IEBAIC0zNTksOCArMzU5LDcgQEAgc3RydWN0IGFtZGdwdV92bV9tYW5hZ2VyIHsK
Pj4gwqDCoMKgwqDCoCAvKiBQQVNJRCB0byBWTSBtYXBwaW5nLCB3aWxsIGJlIHVzZWQgaW4gaW50
ZXJydXB0IGNvbnRleHQgdG8KPj4gwqDCoMKgwqDCoMKgICogbG9vayB1cCBWTSBvZiBhIHBhZ2Ug
ZmF1bHQKPj4gwqDCoMKgwqDCoMKgICovCj4+IC3CoMKgwqAgc3RydWN0IGlkcsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBwYXNpZF9pZHI7Cj4+IC3CoMKgwqAgc3BpbmxvY2tfdMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYXNpZF9sb2NrOwo+PiArwqDCoMKgIHN0cnVjdCB4
YXJyYXnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFzaWRzOwo+PiDCoCB9Owo+PiDC
oCDCoCBzdHJ1Y3QgYW1kZ3B1X2JvX3ZhX21hcHBpbmc7Cj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4Cg==
