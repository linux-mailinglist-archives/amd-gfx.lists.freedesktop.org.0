Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1236E2D3274
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Dec 2020 19:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73266E03C;
	Tue,  8 Dec 2020 18:57:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993836E9A4;
 Tue,  8 Dec 2020 18:57:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwTq7vf9WkSvzqtimctYgxFpUtBZOC4AC34+WPzTWeTjWnimbB3ATCje+Z41BasE36T4pGjQ286iDE0DcVN9YpQz0tmBNsz2HvM12DxevwbiYiuHcaZFdZHZy+AVLu8Ip7d3+sKmHnEqqEXY3NBqsBgWpNNd9jB+Zs1c9KVLXU9TIR7MH/P0u/ybbUQ9C8zbigtqqOg4BpeoqkRZ5Fwt4fvkt1wD3TrzOiKkqBgjfZcMWFVJhzp/w7eAmMXEGzvC/Mz0FX1z77V4BSRCclNOz+2zItKWYu9jTi/ideVfdVJmJlyxROSvxt42fvWcmDZCgXv+U3swGHcAb5aM8JNL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5HEvaO43XqFqHsBBpBlVKgiLfEChgeNmeaiBYyHuGY=;
 b=gTClD2gswrbHN05+itYGwb88uP4Ycbu/nj066Wyw9TU+6LSwDrpBS00gHwiZWwBv4sUiXx4Krlb8noittyPldTpNp6oEO2GGmnz5qWqK7RHIsHY4+PR2EFFIMhfdotfU8g05fyRLZZBAiPHIyitzomww9DlmerBBhynxdHFGBh1MqKqxVjgETM9qVIH9N7ThNeG8tJcfzlOcVbj0Kq3MjWnJERIQbHujp1geO0krO4ZQvv68L4Y4wDAXRvwzkVbnGSvi4Idby7MQZMt/dZrfoblfQQnyY7GPuPEJZYBzwCroqGYIRYZwhoNWkM9zgcUYgd8MPaCNrplKlbg0FbePfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5HEvaO43XqFqHsBBpBlVKgiLfEChgeNmeaiBYyHuGY=;
 b=dz63iepC5kC+tyyMvV7jB0n/1SNvopQWyWMue1V0AEduZKztWYtprNkow5KxJwJFSen6iRST6SSiFLtG1LQQHfwEUSN8pBf7mKsvdBFRv5wot2O183BwL36rfwhtNDoysTYL3FLPIXBWDMpCVNPDQLmlw0opWqYz9lY/JmmkuBs=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4267.namprd12.prod.outlook.com (2603:10b6:5:21e::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20; Tue, 8 Dec 2020 18:52:38 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 18:52:38 +0000
Subject: Re: [PATCH] drm/amdgpu: Initialise drm_gem_object_funcs for imported
 BOs
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <1607447432-28982-1-git-send-email-andrey.grodzovsky@amd.com>
 <76baebc8-6fd3-6b28-8c62-bd049875a8c5@gmail.com>
 <dde83a65-07ae-2285-9999-a5c0f09dc1d3@amd.com>
 <e1cd7521-a9ac-0830-8be9-c03838c151bc@amd.com>
 <3ac4b80b-5eeb-fd80-c458-98539c075424@amd.com>
 <1ad9ddd5-560c-842e-3eea-f09663ea1b60@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <1b93677a-b8d0-1c28-eb2e-d1a341e2c93e@amd.com>
Date: Tue, 8 Dec 2020 13:52:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <1ad9ddd5-560c-842e-3eea-f09663ea1b60@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::35) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.231.243] (165.204.55.251) by
 YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Tue, 8 Dec 2020 18:52:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 52c72453-7e7b-42ec-b0a3-08d89baa6f58
X-MS-TrafficTypeDiagnostic: DM6PR12MB4267:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4267488CF2A06C00A1A84345EACD0@DM6PR12MB4267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qsUFEm8+ygRISwNYeq54e6ulzlWVSrAt5bzi0+bwF9NOtuD30iVk8jx2TzwL3D9IZwWleUlGoVQhDBDNQ36RtLVmFqAW0c81mKiuQlsM31TFqojfQnws2KL6NKTTZBFoduB5eKrVbu64AcwwAhsDGCmZnoTYmHAbO03fYHZsSeiw5et96hY4lXB6ceVgSz0mMOPj0hC0QipCQniOYdaDfQ8in8atS+qm8Cyi11/g4yC0RKDNiLj85soT5FQwS4ZMofwfCRvENssoM3uFqr18nwnOPJ0tBz98AVLX7yXuMbhqnnUPnuKTL/6RdzXj3RseJ+FVKeHjalTkLo0/GNSlfM1X2BoR49fRM+Cpr2xRHDU8zu/t9jDVRwCCOyuw4nqtnvXj6upxnyiRmZB5YvTi1XOTzAxjq8Qn486p7jGE9Q97lxDWkA3oJj96f+/0AH2i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(53546011)(5660300002)(2616005)(6486002)(66476007)(66556008)(66946007)(31696002)(4326008)(86362001)(26005)(186003)(83380400001)(36756003)(8676002)(2906002)(66574015)(31686004)(956004)(16526019)(8936002)(16576012)(52116002)(508600001)(34490700003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q0REWFRrVUpqUzh4YkpCRnMycEJ3ejRSQmVOcVNqaWhCSW9wUERidEVQYVRn?=
 =?utf-8?B?d3Mvd3hSV1ZVZEh6YzhLMGtLT3hIR2VDL0YrZlNadDFWNVo2bGFFangvRVNr?=
 =?utf-8?B?cjRSdzdRaVpINjZ2andJaExQSnRYT2JzeEg5YzJDak9ON1NoWWZsUzJ4d3Zz?=
 =?utf-8?B?V0tjRUtLdWhwQVJBWnU4RDkxNDIrOFhabHo3TkRLdGVUdytJaTVDVndkOXlu?=
 =?utf-8?B?NEhuZHBRcy92OHBGY3Q2OWx3cVZudEljVDBPMGlnazBhazlGQzVPNllRaUVz?=
 =?utf-8?B?TTV3OGVpUXVmemVIVDVYSU9Sb2YzV3VHSWJMRms0ZEp1UTB4ZlQwU254ZFhS?=
 =?utf-8?B?WHVKeFd4Sk5PSThhQzYzVlJXVFlVTnp5NS9HVXhSM2U0a3VXNTUzZzZ5VDkr?=
 =?utf-8?B?SEhraU1rS1lQYzlBbUNYWi9YT09VdTdMcXdyVzlodFF6SW9UUEdtMVI1cHBW?=
 =?utf-8?B?bTBKMzFDYmlwbmFLdXdVNHk2TExKQWNsTURaN0V0Z2dzNDl2ZDhuNzVWT1Fu?=
 =?utf-8?B?OC8xUGlXSFpNUFI0Uk1RVnA4L1RjTS83YVdONXBoYnd4SEdMWFJBbkZVSitY?=
 =?utf-8?B?TUVIYTQ1ckd2YldERCsxaXZzS21UeVJwZE5Ud0RtdUJNN0NFTDEvaG1wQlB2?=
 =?utf-8?B?R2U5YjhWcmthY1dsWFNNallwZjlWZHdrcnJjYW9CNDEwckpXay9hd3R1cEJn?=
 =?utf-8?B?cGJ6a3pZRUp0a1ZYUkhWY2E0dzFxVGUxNWJmLy9vbDAvcjFkNzFkTUZMTWV5?=
 =?utf-8?B?djEwOUxEeTFOb1ZIZkV4K1JzV3hnaHcwMWE2aXVTcWw2MEcvaitKRWY0YnZB?=
 =?utf-8?B?Wjc4VWhvQjdKQWtkMnlicVdseUlvcEkrQjlzRUVsUHFUVnlDVTFUU244N3B0?=
 =?utf-8?B?WWlEd3JLd0t1RXV3YSsyUGtDUm0wNm1hQk00OVFvbjh2L3hNdlZGY1hSVEd6?=
 =?utf-8?B?Q2lUZXlMc0tUbWE5TEJLRUE0Rk9Sbk1LMFpMb21iT0R4Q0x6TjdBZGMxMlha?=
 =?utf-8?B?RGxxU2hDM3BBc1JkTUlYWmlKTW4vQUszN2RVMXNQanFiVm1jVkdlS045QXoz?=
 =?utf-8?B?eEtyTmdqKyszWHozSEtNK2kyaXViaW5oTmNYbWE3UU81TnIvR2MzNUNBcExH?=
 =?utf-8?B?c3RPaUdidUExQjNydlI5b3llTVFSQVkzdVRWM01lNi83bFhPWTMvanNKWWp0?=
 =?utf-8?B?WVVaS2VCZjF1U3hSMjZUOTZhekhuaVlZdDJ6M25EWk1LS1JFN0xrWmk2MTBs?=
 =?utf-8?B?MEdBckhZK1Z4TTZvbDBjTFlUYzZKUmxETytNcnlwUXFqazZucUFhN09GNEtU?=
 =?utf-8?Q?b6rbQXk/oz71Kjy8CJq0AZmc0r9DS0jVoX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 18:52:38.7007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c72453-7e7b-42ec-b0a3-08d89baa6f58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvmfDrFNsg1yUpzNNE/1dmw48uo58IsBlR3XkagRg2+nqaGWlHIN887Uqp3Sf/8j7qDitdbRcqvabrb8qH1h1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4267
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
Cc: Alexander.Deucher@amd.com, tzimmermann@suse.de,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDEyLzgvMjAgMTo0NyBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAwOC4xMi4y
MCB1bSAxOTo0NCBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pgo+PiBPbiAxMi84LzIwIDE6
MjkgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBBbSAwOC4xMi4yMCB1bSAxOToyNiBz
Y2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Cj4+Pj4gT24gMTIvOC8yMCAxMjozNiBQTSwg
Q2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4gQW0gMDguMTIuMjAgdW0gMTg6MTAgc2Nocmll
YiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+IEZvciBCT3MgaW1wb3J0ZWQgZnJvbSBvdXRzaWRl
IG9mIGFtZGdwdSwgc2V0dGluZyBvZiBhbWRncHVfZ2VtX29iamVjdF9mdW5jcwo+Pj4+Pj4gd2Fz
IG1pc3NpbmcgaW4gYW1kZ3B1X2RtYV9idWZfY3JlYXRlX29iai4gRml4IGJ5IHJlZmFjdG9yaW5n
IEJPIGNyZWF0aW9uCj4+Pj4+PiBhbmQgYW1kZ3B1X2dlbV9vYmplY3RfZnVuY3Mgc2V0dGluZyBp
bnRvIHNpbmdsZSBmdW5jdGlvbiBjYWxsZWQKPj4+Pj4+IGZyb20gYm90aCBjb2RlIHBhdGhzLgo+
Pj4+Pgo+Pj4+PiBDYW4geW91IG91dGxpbmUgd2h5IHdlIGNhbid0IHVzZSBhbWRncHVfZ2VtX29i
amVjdF9jcmVhdGUoKSBkaXJlY3RseT8KPj4+Pj4KPj4+Pj4gSSBtZWFuIHdlIGhhdmUgYSBiaXQg
b2YgZXh0cmEgZXJyb3IgaGFuZGxpbmcgaW4gdGhlcmUgYW5kIHdlIG5lZWQgdG8gZ3JhYiAKPj4+
Pj4gdGhlIHJlc3YgbG9jayBhbmQgc2V0IHRoZSBkb21haW5zIGFmdGVyIGNyZWF0aW9uLCBidXQg
dGhhdCBzaG91bGRuJ3QgCj4+Pj4+IG1hdHRlciBhbmQgSSBkb24ndCBzZWUgd2h5IHRoYXQgc2hv
dWxkIG5vdCB3b3JrLgo+Pj4+Cj4+Pj4KPj4+PiBPbiB0b3Agb2Ygd2hhdCB5b3UgbWVudGlvbmVk
IHlvdSBhbHNvIGhhdmUgYnAuZG9tYWluL2JwLnByZWZlcnJlZF9kb21haW4gCj4+Pj4gYmVpbmcg
c2V0IGRpZmZlcmVudGx5IHNvIHlvdSBuZWVkIHRvIGFkZCBhbm90aGVyCj4+Pj4gYXJndW1lbnQg
dG8gYW1kZ3B1X2dlbV9vYmplY3RfY3JlYXRlIHRvIHJlZmxlY3QgdGhpcyBkaWZmZXJlbmNlIHdo
aWNoIAo+Pj4+IGNsdXR0ZXJzIGV2ZW4gbW9yZSB0aGUgYWxyZWFkeSBjbHV0dGVyZWQgYXJndW1l
bnQgbGlzdC4KPj4+Cj4+PiBUaGF0IHNob3VsZCBiZSBvdXRzaWRlIG9mIHRoZSBjYWxsIHRvIGFt
ZGdwdV9nZW1fb2JqZWN0X2NyZWF0ZSgpLCBzaW1pbGFyIHRvIAo+Pj4gaG93IGl0IGlzIG91dHNp
ZGUgb2YgdGhlIGFtZGdwdV9ib19jcmVhdGUgY3VycmVudGx5Lgo+Pgo+Pgo+PiBTbyB5b3UgYWdy
ZWUgd2UgaGF2ZSB0byBhZGQgYW5vdGhlciBhcmd1bWVudCB0byBhbWRncHVfZ2VtX29iamVjdF9j
cmVhdGUgCj4+IChlLmcuIHUzMiBwcmVmZXJyZWRfZG9tYWluKSB3aGljaCB3aWxsIGJlIDAgZm9y
IGFtZGdwdV9kbWFfYnVmX2NyZWF0ZV9vYmoKPj4gYW5kIGVxdWFsIHRvIGluaXRpYWxfZG9tYWlu
IGZvciBhbGwgdGhlIGNvZGUgcGF0aCBjdXJyZW50bHkgY2FsbGluZyAKPj4gYW1kZ3B1X2dlbV9v
YmplY3RfY3JlYXRlID8KPgo+IE5vLCBJIGp1c3QgZG9uJ3Qgc2VlIHRoZSBuZWVkIGZvciB0aGF0
LiBXZSBuZWVkIHRvIG92ZXJ3cml0ZSB0aGUgcHJlZmVycmVkIAo+IGRvbWFpbiBhZnRlciB0aGUg
ZnVuY3Rpb24gY2FsbCBhbnl3YXkuCj4KPiBETUEtYnVmIGltcG9ydHMgYXJlIGNyZWF0ZWQgd2l0
aCB0aGUgaW5pdGlhbCBkb21haW4gQ1BVIGFuZCB0aGVuIGdldCB0aGF0IAo+IG92ZXJ3cml0dGVu
IHRvIEdUVCBhZnRlciBjcmVhdGlvbi4KPgo+Pgo+Pgo+Pj4KPj4+PiBSZWdhcmRpbmcgdGhlIGV4
dHJhIGVycm9yIGhhbmRsaW5nIC0geW91IGhhdmUgdGhlICdyZXRyeScgZGFuY2UgaW4gCj4+Pj4g
YW1kZ3B1X2dlbV9vYmplY3RfY3JlYXRlIHdoaWNoIGp1bXBzIGJhY2sgdG8gdGhlIG1pZGRsZSBv
ZiBhbWRncHVfYm9fcGFyYW0KPj4+PiBpbml0aWFsaXphdGlvbiBidXQgeW91IGRvbid0IGhhdmUg
aXQgaW4gYW1kZ3B1X2RtYV9idWZfY3JlYXRlX29iaiB3aGljaCAKPj4+PiBhbHNvIGNvbXBsaWNh
dGVzIHRoZSByZXVzZSBvZiBhbWRncHVfZ2VtX29iamVjdF9jcmVhdGUgYXMgaXMuCj4+Pgo+Pj4g
UmVnYXJkaW5nIHRoZSBleHRyYSBlcnJvciBoYW5kbGluZywgdGhhdCBraWNrcyBpbiBvbmx5IHdo
ZW4gCj4+PiBBTURHUFVfR0VNX0NSRUFURV9DUFVfQUNDRVNTX1JFUVVJUkVEIGlzIHNwZWNpZmll
ZCBhcyBmbGFncyBvciAKPj4+IEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0gYXMgaW5pdGlhbCBkb21h
aW4uIE5laXRoZXIgaXMgdGhlIGNhc2UgaGVyZS4KPj4KPj4KPj4gWWVzLCBzdGlsbCwgaXQgbWFr
ZXMgbWUgYSBiaXQgdW5jb21mb3J0YWJsZSByZWx5aW5nIG9uIGludGVybmFsIAo+PiBpbXBsZW1l
bnRhdGlvbiBkZXRhaWxzIG9mIGFuIEFQSSBmdW5jdGlvbiBJIGNhbGwgdG8gZG8gdGhlIHRoaW5n
IEkgZXhwZWN0Lgo+Cj4gWWVhaCwgb2sgdGhhdCBpcyBhIHJhdGhlciBnb29kIGFyZ3VtZW50Lgo+
Cj4gQ2hyaXN0aWFuLgoKClNvIHNob3VsZCBJIGp1c3Qga2VlcCBpdCBhcyBpcyBvciB5b3UgdGhp
bmsgaXQncyBzdGlsbCB3b3VsZCBiZSBtb3JlIGJlbmVmaWNpYWwgCnRvIHVuaWZ5IHRoZW0gdGhl
IHdheSB5b3UgcHJvcG9zZSA/CgpBbmRyZXkKCgo+Cj4+Cj4+IEFuZHJleQo+Pgo+Pgo+Pj4KPj4+
IENocmlzdGlhbi4KPj4+Cj4+Pj4KPj4+PiBBbmRyZXkKPj4+Pgo+Pj4+Cj4+Pj4+Cj4+Pj4+IFRo
YW5rcywKPj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFRoaXMgZml4ZXMgbnVs
bCBwdHIgcmVncmVzc2lvbiBjYXN1ZWQgYnkgY29tbWl0Cj4+Pj4+PiBkNjkzZGVmIGRybTogUmVt
b3ZlIG9ic29sZXRlIEdFTSBhbmQgUFJJTUUgY2FsbGJhY2tzIGZyb20gc3RydWN0IGRybV9kcml2
ZXIKPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyB8IDEzICsrKysrKy0tLS0tLS0KPj4+Pj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uY8KgwqDCoMKgIHwgMjIgKysr
KysrKysrKysrKysrKystLS0tLQo+Pj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dlbS5owqDCoMKgwqAgfMKgIDUgKysrKysKPj4+Pj4+IMKgIDMgZmlsZXMgY2hhbmdl
ZCwgMjggaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMgCj4+Pj4+
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKPj4+Pj4+IGlu
ZGV4IGU1OTE5ZWYuLmRhNGQwYWIgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCj4+Pj4+PiBAQCAtNDA1LDYgKzQwNSw3IEBAIHN0
cnVjdCBkbWFfYnVmICphbWRncHVfZ2VtX3ByaW1lX2V4cG9ydChzdHJ1Y3QgCj4+Pj4+PiBkcm1f
Z2VtX29iamVjdCAqZ29iaiwKPj4+Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIGJ1ZjsKPj4+Pj4+IMKg
IH0KPj4+Pj4+IMKgICsKPj4+Pj4+IMKgIC8qKgo+Pj4+Pj4gwqDCoCAqIGFtZGdwdV9kbWFfYnVm
X2NyZWF0ZV9vYmogLSBjcmVhdGUgQk8gZm9yIERNQS1idWYgaW1wb3J0Cj4+Pj4+PiDCoMKgICoK
Pj4+Pj4+IEBAIC00MjQsNyArNDI1LDcgQEAgYW1kZ3B1X2RtYV9idWZfY3JlYXRlX29iaihzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCAKPj4+Pj4+IHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmKQo+Pj4+
Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGRybV90b19hZGV2KGRl
dik7Cj4+Pj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfYm8gKmJvOwo+Pj4+Pj4gwqDCoMKg
wqDCoCBzdHJ1Y3QgYW1kZ3B1X2JvX3BhcmFtIGJwOwo+Pj4+Pj4gLcKgwqDCoCBpbnQgcmV0Owo+
Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iajsKPj4+Pj4+IMKgIMKgwqDC
oMKgwqAgbWVtc2V0KCZicCwgMCwgc2l6ZW9mKGJwKSk7Cj4+Pj4+PiDCoMKgwqDCoMKgIGJwLnNp
emUgPSBkbWFfYnVmLT5zaXplOwo+Pj4+Pj4gQEAgLTQzNCwyMSArNDM1LDE5IEBAIGFtZGdwdV9k
bWFfYnVmX2NyZWF0ZV9vYmooc3RydWN0IGRybV9kZXZpY2UgKmRldiwgCj4+Pj4+PiBzdHJ1Y3Qg
ZG1hX2J1ZiAqZG1hX2J1ZikKPj4+Pj4+IMKgwqDCoMKgwqAgYnAudHlwZSA9IHR0bV9ib190eXBl
X3NnOwo+Pj4+Pj4gwqDCoMKgwqDCoCBicC5yZXN2ID0gcmVzdjsKPj4+Pj4+IMKgwqDCoMKgwqAg
ZG1hX3Jlc3ZfbG9jayhyZXN2LCBOVUxMKTsKPj4+Pj4+IC3CoMKgwqAgcmV0ID0gYW1kZ3B1X2Jv
X2NyZWF0ZShhZGV2LCAmYnAsICZibyk7Cj4+Pj4+PiAtwqDCoMKgIGlmIChyZXQpCj4+Pj4+PiAr
wqDCoMKgIG9iaiA9IGFtZGdwdV9nZW1fb2JqZWN0X2NyZWF0ZV9yYXcoYWRldiwgJmJwKTsKPj4+
Pj4+ICvCoMKgwqAgaWYgKElTX0VSUihvYmopKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdv
dG8gZXJyb3I7Cj4+Pj4+PiDCoCArwqDCoMKgIGJvID0gZ2VtX3RvX2FtZGdwdV9ibyhvYmopOwo+
Pj4+Pj4gwqDCoMKgwqDCoCBiby0+YWxsb3dlZF9kb21haW5zID0gQU1ER1BVX0dFTV9ET01BSU5f
R1RUOwo+Pj4+Pj4gwqDCoMKgwqDCoCBiby0+cHJlZmVycmVkX2RvbWFpbnMgPSBBTURHUFVfR0VN
X0RPTUFJTl9HVFQ7Cj4+Pj4+PiDCoMKgwqDCoMKgIGlmIChkbWFfYnVmLT5vcHMgIT0gJmFtZGdw
dV9kbWFidWZfb3BzKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJvLT5wcmltZV9zaGFyZWRf
Y291bnQgPSAxOwo+Pj4+Pj4gwqAgLcKgwqDCoCBkbWFfcmVzdl91bmxvY2socmVzdik7Cj4+Pj4+
PiAtwqDCoMKgIHJldHVybiAmYm8tPnRiby5iYXNlOwo+Pj4+Pj4gLQo+Pj4+Pj4gwqAgZXJyb3I6
Cj4+Pj4+PiDCoMKgwqDCoMKgIGRtYV9yZXN2X3VubG9jayhyZXN2KTsKPj4+Pj4+IC3CoMKgwqAg
cmV0dXJuIEVSUl9QVFIocmV0KTsKPj4+Pj4+ICvCoMKgwqAgcmV0dXJuIG9iajsKPj4+Pj4+IMKg
IH0KPj4+Pj4+IMKgIMKgIC8qKgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyAKPj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dlbS5jCj4+Pj4+PiBpbmRleCBjOWY5NGZiLi41ZjIyY2U2IDEwMDY0NAo+Pj4+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCj4+Pj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKPj4+Pj4+IEBAIC01
MiwxMyArNTIsMjYgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2dlbV9vYmplY3RfZnJlZShzdHJ1Y3Qg
Cj4+Pj4+PiBkcm1fZ2VtX29iamVjdCAqZ29iaikKPj4+Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+Pj4g
wqAgfQo+Pj4+Pj4gwqAgK3N0cnVjdCBkcm1fZ2VtX29iamVjdCAqYW1kZ3B1X2dlbV9vYmplY3Rf
Y3JlYXRlX3JhdyhzdHJ1Y3QgCj4+Pj4+PiBhbWRncHVfZGV2aWNlICphZGV2LAo+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgYW1kZ3B1X2JvX3BhcmFtICpicCkKPj4+Pj4+ICt7Cj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBh
bWRncHVfYm8gKmJvOwo+Pj4+Pj4gK8KgwqDCoCBpbnQgcjsKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKg
wqAgciA9IGFtZGdwdV9ib19jcmVhdGUoYWRldiwgYnAsICZibyk7Cj4+Pj4+PiArwqDCoMKgIGlm
IChyKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKHIpOwo+Pj4+Pj4gKwo+
Pj4+Pj4gK8KgwqDCoCBiby0+dGJvLmJhc2UuZnVuY3MgPSAmYW1kZ3B1X2dlbV9vYmplY3RfZnVu
Y3M7Cj4+Pj4+PiArwqDCoMKgIHJldHVybiAmYm8tPnRiby5iYXNlOwo+Pj4+Pj4gK30KPj4+Pj4+
ICsKPj4+Pj4+IMKgIGludCBhbWRncHVfZ2VtX29iamVjdF9jcmVhdGUoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsIHVuc2lnbmVkIGxvbmcgCj4+Pj4+PiBzaXplLAo+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBhbGlnbm1lbnQsIHUzMiBpbml0aWFsX2Rv
bWFpbiwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1NjQgZmxh
Z3MsIGVudW0gdHRtX2JvX3R5cGUgdHlwZSwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX3Jlc3YgKnJlc3YsCj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICoqb2JqKQo+Pj4+
Pj4gwqAgewo+Pj4+Pj4gLcKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2JvICpibzsKPj4+Pj4+IMKgwqDC
oMKgwqAgc3RydWN0IGFtZGdwdV9ib19wYXJhbSBicDsKPj4+Pj4+IMKgwqDCoMKgwqAgaW50IHI7
Cj4+Pj4+PiDCoCBAQCAtNzMsOCArODYsOSBAQCBpbnQgYW1kZ3B1X2dlbV9vYmplY3RfY3JlYXRl
KHN0cnVjdCBhbWRncHVfZGV2aWNlIAo+Pj4+Pj4gKmFkZXYsIHVuc2lnbmVkIGxvbmcgc2l6ZSwK
Pj4+Pj4+IMKgIHJldHJ5Ogo+Pj4+Pj4gwqDCoMKgwqDCoCBicC5mbGFncyA9IGZsYWdzOwo+Pj4+
Pj4gwqDCoMKgwqDCoCBicC5kb21haW4gPSBpbml0aWFsX2RvbWFpbjsKPj4+Pj4+IC3CoMKgwqAg
ciA9IGFtZGdwdV9ib19jcmVhdGUoYWRldiwgJmJwLCAmYm8pOwo+Pj4+Pj4gLcKgwqDCoCBpZiAo
cikgewo+Pj4+Pj4gK8KgwqDCoCAqb2JqID0gYW1kZ3B1X2dlbV9vYmplY3RfY3JlYXRlX3Jhdyhh
ZGV2LCAmYnApOwo+Pj4+Pj4gK8KgwqDCoCBpZiAoSVNfRVJSKCpvYmopKSB7Cj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgciA9IFBUUl9FUlIoKm9iaik7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKHIgIT0gLUVSRVNUQVJUU1lTKSB7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAoZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9DUFVfQUNDRVNTX1JFUVVJUkVEKSB7Cj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZsYWdzICY9IH5BTURHUFVf
R0VNX0NSRUFURV9DUFVfQUNDRVNTX1JFUVVJUkVEOwo+Pj4+Pj4gQEAgLTkwLDggKzEwNCw2IEBA
IGludCBhbWRncHVfZ2VtX29iamVjdF9jcmVhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgCj4+Pj4+
PiAqYWRldiwgdW5zaWduZWQgbG9uZyBzaXplLAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0K
Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcjsKPj4+Pj4+IMKgwqDCoMKgwqAgfQo+
Pj4+Pj4gLcKgwqDCoCAqb2JqID0gJmJvLT50Ym8uYmFzZTsKPj4+Pj4+IC3CoMKgwqAgKCpvYmop
LT5mdW5jcyA9ICZhbWRncHVfZ2VtX29iamVjdF9mdW5jczsKPj4+Pj4+IMKgIMKgwqDCoMKgwqAg
cmV0dXJuIDA7Cj4+Pj4+PiDCoCB9Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5oIAo+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2VtLmgKPj4+Pj4+IGluZGV4IDYzN2JmNTEuLmE2YjkwZDMgMTAwNjQ0Cj4+
Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmgKPj4+Pj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uaAo+Pj4+Pj4gQEAg
LTM4LDEyICszOCwxNyBAQCB1bnNpZ25lZCBsb25nIGFtZGdwdV9nZW1fdGltZW91dCh1aW50NjRf
dCB0aW1lb3V0X25zKTsKPj4+Pj4+IMKgIC8qCj4+Pj4+PiDCoMKgICogR0VNIG9iamVjdHMuCj4+
Pj4+PiDCoMKgICovCj4+Pj4+PiArCj4+Pj4+PiArc3RydWN0IGFtZGdwdV9ib19wYXJhbTsKPj4+
Pj4+ICsKPj4+Pj4+IMKgIHZvaWQgYW1kZ3B1X2dlbV9mb3JjZV9yZWxlYXNlKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KTsKPj4+Pj4+IMKgIGludCBhbWRncHVfZ2VtX29iamVjdF9jcmVhdGUo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVuc2lnbmVkIGxvbmcgCj4+Pj4+PiBzaXplLAo+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBhbGlnbm1lbnQs
IHUzMiBpbml0aWFsX2RvbWFpbiwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1NjQgZmxhZ3MsIGVudW0gdHRtX2JvX3R5cGUgdHlwZSwKPj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX3Jlc3YgKnJlc3YsCj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICoqb2JqKTsKPj4+Pj4+ICtzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmFtZGdwdV9nZW1fb2Jq
ZWN0X2NyZWF0ZV9yYXcoc3RydWN0IGFtZGdwdV9kZXZpY2UgCj4+Pj4+PiAqYWRldiwKPj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IGFtZGdwdV9ib19wYXJhbSAqYnApOwo+Pj4+Pj4gwqAgwqAgaW50IGFtZGdwdV9tb2Rl
X2R1bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LAo+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+Pj4+Pgo+
Pj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
