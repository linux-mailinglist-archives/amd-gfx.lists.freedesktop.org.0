Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDC83AE839
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Jun 2021 13:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00691899A5;
	Mon, 21 Jun 2021 11:35:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09714899A5
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Jun 2021 11:35:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCjMllCyk+Syy0aHFV0DFOylIS454PYY7LklYH7WW08sYaAz62SvfnsMVNzuMaQuFv1RCDugYMJWpN+jBu+eE516/FcDCd1HRrO4EU2tjfX+llCwRVAIJdXdiWWW/SIHVewseTrUk8GRUTB1jkYtnJU7NXQQafzLXhUhO1OTiXSkLtD4O6qFeMu3g3qaeRQtkUo/nQcukdKyDKiPn5FiTZJEdA+1Y3dOIXMiQMSn4tfQPsptjNcoxBJhCMsqqCZ3ZJfsPexiwdNOumlaoA9by5JEHPbryI/IOYqotJquXiWe1PQ+dnwv8/+xIJIM5mL60PQL0c9C/WjDS7swAcGvEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+bwMO+ZT6zOd3xF3iGL6GAZeGNhWt6mFHZBe89fjuM=;
 b=k2IITAAixr1jALSPrgksJUJbeZGZs1DYWKzFTgpdj/MV9/cX+1ioJ4527+QU7DP0ctS3DeiZgesvo0zSkSQ1/Ho2jlNhMmZv+TT16xJjyVDQh3ku5ed/PqXCqEY1sQwbO6Ui64LzYDrOQ3aHL4jydPKGo6rfTilGLSi+RFRcsRvu8dOCfY/ThtUda7oVj3ypg23pEq47Rw2uxC0+qerxwyfnl81IpntqNWUH2ptyn4Dl2SsxwQET/caqvnOVE+v9X1u3IfGhCdGiR93eegNDDwAraD6iVZWmw+a3AmiZaW6Bog5VtRfIxiJ+raEGd5nkHkEb1eLFGHA79sHrZG5evw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+bwMO+ZT6zOd3xF3iGL6GAZeGNhWt6mFHZBe89fjuM=;
 b=gUD93Z5dxOlgLKz/A/HdrEYwi1GWEVxrmbzjQLMYpnZheu/ikZp94d9+4H1lTundSs6gCnElLGcZk9sG2JwczFdLjo3PYkY266D0qZ/WLTyzxT0MMcXBmJqYgOVOrjeSiDA5hCHcjFZxTc9PiHkG7Y3WGdm+PBcvL62Du09wgLo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4900.namprd12.prod.outlook.com (2603:10b6:208:1c1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Mon, 21 Jun
 2021 11:35:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 11:35:21 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: add helper function for vm pasid
To: "Das, Nirmoy" <nirmoy.das@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org
References: <20210617130334.15366-1-nirmoy.das@amd.com>
 <5745d21a-93e2-4446-3299-f7a807136817@amd.com>
 <f3242ccb-6d71-bfc3-6425-c46679b0ada1@amd.com>
 <6ae31f0a-712b-0404-5885-c2a7ca244d38@amd.com>
 <26ce2800-e2f0-2dd6-bf7d-b837a55a3c42@amd.com>
 <f6df3cf8-3402-7876-f865-7f8bbd996907@amd.com>
 <0952081a-d779-b676-4db7-c828bfd9bfe3@gmail.com>
 <0eeb25b2-7592-594d-e025-bbaf3ec604a8@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a2bf5061-0b71-cea5-ea4f-28c42d832d9f@amd.com>
Date: Mon, 21 Jun 2021 13:35:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <0eeb25b2-7592-594d-e025-bbaf3ec604a8@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:aae5:6e05:c:d69]
X-ClientProxiedBy: PR3P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:aae5:6e05:c:d69]
 (2a02:908:1252:fb60:aae5:6e05:c:d69) by
 PR3P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Mon, 21 Jun 2021 11:35:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f6196a5-1bc2-4b98-51e8-08d934a8a74f
X-MS-TrafficTypeDiagnostic: BL0PR12MB4900:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4900B0A982DB16529865E9B4830A9@BL0PR12MB4900.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oZRDs2YjshFTWmyUgbgR0WpbVjjyclgBJXSESUyi2LC8lTFydRX9dX2aURBRSe4OFttA9r9B1/QHT6SgcI6laZowT+qL73eFusopTRuS0gBpZjwcoB1+0nw7+Uki5BcCCgJha0FDIdUTOYYfgqU/mo0ZlAicmsIzriCJ95ZO8ZfjB29R06v1eoClTEXriaHANZ42ifEixjfsfXas5As0zKfhImqam46369v4V7m0ELUTjogjm6CVnOJX0V5vspGJKrRyLiYVWk8S1L+wGr9U86WCG4v/poUDfsrbNIi+CMvpw/O24xhk4NqdlnZ3SAKFTW2veI4AZLjtKyMUFPG6eYnkcNVaI2+/2IJK20nwTpIRwtfKbPJLJ6ofpD2h8GNpd4peS39KwcwVRCRuZPqp4otm2okR96Yg+UolUWiIPmGOzViKqVGKwL4CGpEZfDUfEd9H8b7A0N1YDXCgWmFsSULAAoYIOuoHISnKYnu1CCzK+o0XjzSqU8uH8b5xdvvWum+Z43roTE3Iz79yHEX7T+++aCyyzY9ZGUJRwkrAM7LUVUjWMrHnxIc4cU4qRxf+IxijgejAerTjbvEb9wa7NgFBPV0LOaYE2lh/9aGAJy/sEyw17Kx6BzB5gYLCR4umD7q9EfOV/eDKkl4t1o3/LLEBDyKEJHYk70SLbfoRjk9HOibOklkqdpEj44/dVcU5Gh8c22ICjHY44wuQPEdqYDEyI6ZqB92KEBh9x8SaVaQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(66574015)(316002)(83380400001)(86362001)(6486002)(478600001)(110136005)(8676002)(38100700002)(8936002)(45080400002)(36756003)(4326008)(53546011)(6666004)(66476007)(66556008)(966005)(5660300002)(31696002)(66946007)(30864003)(31686004)(2906002)(2616005)(186003)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2VaMmRKeUJwZUsreDZIdTBDNjJET0Evd0w5dXZPamV6R0E2TlAxMXFrKzhv?=
 =?utf-8?B?aFJrZGNxWFhzQjBtNWpTd1Fvc1hrdExYOWtxZFZSRmJoT3dvb1loYTEydzhL?=
 =?utf-8?B?cUVQTHIrVVNncnJJcHVwNjVWTkxpemlGQVRTK3pGaEZZTjhEVS94cEdKbmpw?=
 =?utf-8?B?Tk12WWNvTGZhRzdwUWMzamhSVVMxaEkrbGlrUWpWWHhoU1lEeGJCYlBHdnFq?=
 =?utf-8?B?SGJIbDhPNXJmWWw0QVExbThnSUM4L0o5WUhQMHdOTW1mc1owNTBaZ1Y3VDBt?=
 =?utf-8?B?bGpzYy9Eb3NibnpaT29zOUJaQzk3V0xneklQMTlOQzZKRGhyM3VWN21aZTYz?=
 =?utf-8?B?QUdkQkZtNktlQ05GdXBQdktMZHpSUytWME1IVDl3d0tySWxqa1g0RGtBc28z?=
 =?utf-8?B?Qm1EdVVad21teVlZK2ZWcm1MWWlFY0liWHNxeU02NENmVEFKYWhIZ1FZZ1o3?=
 =?utf-8?B?SnN1bUd4amVER1hWWEpQU054YlhHVFpUZGlWdnd2cjZNNFJUWStQQVVHQ1ND?=
 =?utf-8?B?bW1FbU1qV2ZnN3R0a2ZRYnQwWFF2c2VWSS9SeWYvbDdRYkhkSWVaVGcrdUI0?=
 =?utf-8?B?bkZ2S1hhemhURHFybUJtaG14U0lBT0pKYmZPNTNyYWZZY2dmVTZIVVNtREk3?=
 =?utf-8?B?SUVRL0lkcURLanhWamZPMDArL0pCcUZGU2MxZitlSkIwQ1FDR2xVTnlEa0V6?=
 =?utf-8?B?cUNhaG9YU1JQNW1yN05UWEJadkxEMDh2U2F6eFNZeDRGdFNlZE5wUElqQ2w1?=
 =?utf-8?B?Y0s3RnRIbVZGbXN0b3dWNHNLdmtQaU40Y3QyUytaY2F0UG5JQmNEMmR0RG5m?=
 =?utf-8?B?QURBbTdOUVJsbGZWUjd2anc5d1FJOTMyM2RKdDJmN3U5eTJDTjNPU0U4Smlt?=
 =?utf-8?B?OFZodWR3ZDZwUWVoanFDUDVSV0R2dlpUUXJubGxGS3pxSlZkZ3hCRUtib2NV?=
 =?utf-8?B?bmNUTUpvbmRObXdhM1l6YWpzenplWi9Ga3NGQlgwTUxpMjFvQUY3SWpjQW9G?=
 =?utf-8?B?eCtRRHpxbUYycU5qMXZZVXZYbzhPbkFmYnJnWFBYYlJyRVZ0MGVVN0VsVE1i?=
 =?utf-8?B?cHM2RFFwOTVXR3ppUkt1V1NOcnQ3RW9MVEk0QTBZNU81T0YrRWpGb25KRDRZ?=
 =?utf-8?B?WHhPb1gzSExwSFBSK2hneDRwYmJxa1dEdWRtRGtLMkJqc1lud0VMYTdINFk5?=
 =?utf-8?B?cjdQMnN2V1dDeVUzRFZES1p4WmZ4bHN4RzlHTGtwY202NnVsVC9Yc05ZWGV5?=
 =?utf-8?B?ejRodjk3cElyenRBOVhGN1M3T3lleFJwOHBCTmVBZ3VSSmJZWWtPMmR3Yyto?=
 =?utf-8?B?RkRHa3R5V1B4RHdGV3NSWkdMLzd0VnNaOVBXcnVVTFRmcFkwNkU5a2xKL0lY?=
 =?utf-8?B?T2dad3pQRHBNWjRLNFlGMWNQTUdVbmhyeDN4akltNTdBckhEak9EdzZ6RXpn?=
 =?utf-8?B?VzZSK3hrUFhWSFQyV0lxdHhxenVTeDA1YXd1K2ZucHhuZmhuL1crWG02K29k?=
 =?utf-8?B?T1lqV2JSdk5QSVJLV04wckEyQTZRQ01vMmIvOFEvT2pHZVVFSDVCU1NuODJX?=
 =?utf-8?B?VU10UWxOOTBFWVB3dldLRUdNS2pzeFFqUU9sQklCSXRibWpQc2FHYkJ6U2Fl?=
 =?utf-8?B?OXdDYm9yZFdtbjNPQ2pQKzVYM1JRSjd1S0VkdGZPYll4YTJyaitQNmFWVG85?=
 =?utf-8?B?WHB0TFVIYzFqV2p3dHJvNFZMZUxsRlpoeGw2Q2l5U0JLNnl0YWFiMlh3a2t3?=
 =?utf-8?B?UXJKbXQ0a3YyUUtwRWd3WnNVelFHSktPTG5XOVZmM21TZitsUnhiNE56QnFH?=
 =?utf-8?B?dzBZbi9tUktVZm9LL1BGTCtHRDg2SHFqTTdwck9ZdjVUWUsrcEw0Rnp0aFhZ?=
 =?utf-8?Q?X8SA/PW95nLwy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6196a5-1bc2-4b98-51e8-08d934a8a74f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 11:35:21.7678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNXJbiW/4sGPHpYR7waGarEr1oDG05nIxniaQ7U339EbInCQVGNHWmo53qdVxHI/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4900
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

QW0gMjEuMDYuMjEgdW0gMTM6Mjcgc2NocmllYiBEYXMsIE5pcm1veToKPgo+IE9uIDYvMjEvMjAy
MSAxOjE4IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBBbSAyMS4wNi4yMSB1bSAxMzox
MCBzY2hyaWViIERhcywgTmlybW95Ogo+Pj4KPj4+IE9uIDYvMjEvMjAyMSAxMjo1OSBQTSwgQ2hy
aXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+PiBBbSAyMS4wNi4yMSB1bSAxMjo1NiBzY2hyaWViIERh
cywgTmlybW95Ogo+Pj4+Pgo+Pj4+PiBPbiA2LzIxLzIwMjEgMTI6MjYgUE0sIENocmlzdGlhbiBL
w7ZuaWcgd3JvdGU6Cj4+Pj4+PiBXZWxsIHlvdSBjb21wbGV0ZWx5IGJyZWFrIHRoZSBoYW5kbGlu
ZyBpbiAKPj4+Pj4+IGFtZGdwdV92bV9oYW5kbGVfZmF1bHQoKSB3aXRoIHRoaXMuCj4+Pj4+Cj4+
Pj4+Cj4+Pj4+IEkgc2VlIG9uZSBpc3N1ZSB3aXRoOsKgIGlmICghdm0gfHwgKHZtICYmIHZtLT5y
b290LmJvICE9IHJvb3QpKSAuIEkgCj4+Pj4+IHdpbGwgc3BsaXQgaXQgYW5kIHJlc2VuZC4KPj4+
Pj4KPj4+Pj4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZyBlbHNlID8KPj4+Pgo+Pj4+IFRoZSBwcm9i
bGVtIGlzIHlvdSBkcm9wIGFuZCByZS10YWtlIHRoZSBsb2NrIG5vdyBhdCB0aGUgd3JvbmcgdGlt
ZS4KPj4+Cj4+Pgo+Pj4gSSBzZWUgdGhlIHByb2JsZW0uCj4+Pgo+Pj4+Cj4+Pj4gSSBkb24ndCB0
aGluayB3aGF0IHlvdSB0cnkgdG8gZG8gaGVyZSBpcyBwb3NzaWJsZSBhdCBhbGwuCj4+Pgo+Pj4K
Pj4+IERvZXMgaXQgbWFrZXMgc2Vuc2UgdG8gcmVzZW5kIHdpdGhvdXQgYW1kZ3B1X3ZtX2hhbmRs
ZV9mYXVsdCgpIAo+Pj4gY2hhbmdlcyA/Cj4+Cj4+IFNvbWUgb3RoZXIgY2hhbmdlcyBkb24ndCBt
YWtlIHNlbnNlIHRvIG1lIGFzIHdlbGwuCj4+Cj4+IEZvciBleGFtcGxlOgo+Pgo+PiBwYXNpZCA9
IGFtZGdwdV9wYXNpZF9hbGxvYygxNik7Cj4+Cj4+IFdoeSBkbyB5b3Ugd2FudCB0byBhbGxvY2F0
ZSBhIGhhcmQgY29kZWQgcGFzaWQgbnVtYmVyIGhlcmU/Cj4KPgo+IFRoaXMgaXMgZnJvbcKgIG9y
aWdpbmFsIGFtZGdwdV9kcml2ZXJfb3Blbl9rbXMoKS4gV2UgYXJlIGFsbG9jYXRpbmcgYSAKPiBw
YXNpZCBudW1iZXIgYW5kIHBhc3NpbmcgdGhhdCB0bwo+Cj4gYW1kZ3B1X3ZtX2luaXQoKS4gSSB3
YW50ZWQgdG8gbW92ZSB0aGF0IHRvIHZtY29kZSB3aXRoIHRoaXMgcGF0Y2guCgpUaGF0IGRvZXNu
J3QgbWFrZSBzZW5zZS4KClRoZSBwYXNpZCBpcyBhIGhhcmR3YXJlIGlkZW50aWZ5IHdoaWNoIGlz
IHVucmVsYXRlZCB0byB0aGUgVk0gaW4gZ2VuZXJhbCAKYW5kIG1pZ2h0IGF0IHNvbWUgcG9pbnQg
cGFzc2VkIGluIGZyb20gZXh0ZXJuYWwuCgpQbGVhc2Uga2VlcCB0aGF0IGFzIHBhcmFtZXRlciB0
byB0aGUgVk0gY29kZSBpZiBwb3NzaWJsZS4KCkNocmlzdGlhbi4KCj4KPgo+IFJlZ2FyZHMsCj4K
PiBOaXJtb3kKPgo+Cj4+Cj4+IENocmlzdGlhbi4KPj4KPj4KPj4+Cj4+Pj4KPj4+PiBDaHJpc3Rp
YW4uCj4+Pj4KPj4+Pj4KPj4+Pj4KPj4+Pj4gUmVnYXJkcywKPj4+Pj4KPj4+Pj4gTmlybW95Cj4+
Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4KPj4+Pj4+IEFt
IDIxLjA2LjIxIHVtIDExOjQ3IHNjaHJpZWIgRGFzLCBOaXJtb3k6Cj4+Pj4+Pj4gcGluZy4KPj4+
Pj4+Pgo+Pj4+Pj4+IE9uIDYvMTcvMjAyMSAzOjAzIFBNLCBOaXJtb3kgRGFzIHdyb3RlOgo+Pj4+
Pj4+PiBDbGVhbnVwIGNvZGUgcmVsYXRlZCB0byB2bSBwYXNpZCBieSBhZGRpbmcgaGVscGVyIGZ1
bmN0aW9uLgo+Pj4+Pj4+PiBUaGlzIHJlZHVjZXMgbG90cyBjb2RlIGR1cGxpY2F0aW9uLgo+Pj4+
Pj4+Pgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5j
b20+Cj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfa21zLmMgfMKgIDE3ICstLQo+Pj4+Pj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uY8KgIHwgMTc2IAo+Pj4+Pj4+PiArKysrKysrKysrKystLS0tLS0tLS0t
LS0KPj4+Pj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmjCoCB8
wqDCoCAyICstCj4+Pj4+Pj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgOTYgaW5zZXJ0aW9ucygrKSwg
OTkgZGVsZXRpb25zKC0pCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgCj4+Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCj4+Pj4+Pj4+IGluZGV4IGNiYjkzMmY5NzM1NS4uMjc4
NTFmYjBlMjViIDEwMDY0NAo+Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfa21zLmMKPj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2ttcy5jCj4+Pj4+Pj4+IEBAIC0xMTQ5LDcgKzExNDksNyBAQCBpbnQgYW1kZ3B1X2Ry
aXZlcl9vcGVuX2ttcyhzdHJ1Y3QgCj4+Pj4+Pj4+IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRy
bV9maWxlICpmaWxlX3ByaXYpCj4+Pj4+Pj4+IMKgIHsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCBzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGRybV90b19hZGV2KGRldik7Cj4+Pj4+Pj4+IMKgwqDC
oMKgwqAgc3RydWN0IGFtZGdwdV9mcHJpdiAqZnByaXY7Cj4+Pj4+Pj4+IC3CoMKgwqAgaW50IHIs
IHBhc2lkOwo+Pj4+Pj4+PiArwqDCoMKgIGludCByOwo+Pj4+Pj4+PiDCoCDCoMKgwqDCoMKgIC8q
IEVuc3VyZSBJQiB0ZXN0cyBhcmUgcnVuIG9uIHJpbmcgKi8KPj4+Pj4+Pj4gZmx1c2hfZGVsYXll
ZF93b3JrKCZhZGV2LT5kZWxheWVkX2luaXRfd29yayk7Cj4+Pj4+Pj4+IEBAIC0xMTcyLDE1ICsx
MTcyLDkgQEAgaW50IGFtZGdwdV9kcml2ZXJfb3Blbl9rbXMoc3RydWN0IAo+Pj4+Pj4+PiBkcm1f
ZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KQo+Pj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byBvdXRfc3VzcGVuZDsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCB9Cj4+Pj4+
Pj4+IMKgIC3CoMKgwqAgcGFzaWQgPSBhbWRncHVfcGFzaWRfYWxsb2MoMTYpOwo+Pj4+Pj4+PiAt
wqDCoMKgIGlmIChwYXNpZCA8IDApIHsKPj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGRldl93YXJu
KGFkZXYtPmRldiwgIk5vIG1vcmUgUEFTSURzIGF2YWlsYWJsZSEiKTsKPj4+Pj4+Pj4gLcKgwqDC
oMKgwqDCoMKgIHBhc2lkID0gMDsKPj4+Pj4+Pj4gLcKgwqDCoCB9Cj4+Pj4+Pj4+IC0KPj4+Pj4+
Pj4gLcKgwqDCoCByID0gYW1kZ3B1X3ZtX2luaXQoYWRldiwgJmZwcml2LT52bSwgcGFzaWQpOwo+
Pj4+Pj4+PiArwqDCoMKgIHIgPSBhbWRncHVfdm1faW5pdChhZGV2LCAmZnByaXYtPnZtKTsKPj4+
Pj4+Pj4gwqDCoMKgwqDCoCBpZiAocikKPj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGdvdG8gZXJy
b3JfcGFzaWQ7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGZyZWVfZnByaXY7Cj4+Pj4+
Pj4+IMKgIMKgwqDCoMKgwqAgZnByaXYtPnBydF92YSA9IGFtZGdwdV92bV9ib19hZGQoYWRldiwg
JmZwcml2LT52bSwgTlVMTCk7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqAgaWYgKCFmcHJpdi0+cHJ0X3Zh
KSB7Cj4+Pj4+Pj4+IEBAIC0xMjA4LDEwICsxMjAyLDcgQEAgaW50IGFtZGdwdV9kcml2ZXJfb3Bl
bl9rbXMoc3RydWN0IAo+Pj4+Pj4+PiBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAq
ZmlsZV9wcml2KQo+Pj4+Pj4+PiDCoCBlcnJvcl92bToKPj4+Pj4+Pj4gwqDCoMKgwqDCoCBhbWRn
cHVfdm1fZmluaShhZGV2LCAmZnByaXYtPnZtKTsKPj4+Pj4+Pj4gwqAgLWVycm9yX3Bhc2lkOgo+
Pj4+Pj4+PiAtwqDCoMKgIGlmIChwYXNpZCkKPj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGFtZGdw
dV9wYXNpZF9mcmVlKHBhc2lkKTsKPj4+Pj4+Pj4gLQo+Pj4+Pj4+PiArZnJlZV9mcHJpdjoKPj4+
Pj4+Pj4gwqDCoMKgwqDCoCBrZnJlZShmcHJpdik7Cj4+Pj4+Pj4+IMKgIMKgIG91dF9zdXNwZW5k
Ogo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZtLmMgCj4+Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMK
Pj4+Pj4+Pj4gaW5kZXggNjM5NzViZGE4ZTc2Li41NjJjMmM0OGEzYTMgMTAwNjQ0Cj4+Pj4+Pj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4+Pj4+Pj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4+Pj4+Pj4+IEBAIC04
Nyw2ICs4Nyw2OSBAQCBzdHJ1Y3QgYW1kZ3B1X3BydF9jYiB7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqAg
c3RydWN0IGRtYV9mZW5jZV9jYiBjYjsKPj4+Pj4+Pj4gwqAgfTsKPj4+Pj4+Pj4gwqAgK3N0YXRp
YyBpbnQgYW1kZ3B1X3ZtX3Bhc2lkX2FsbG9jKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+
Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV92
bSAqdm0sIHVuc2lnbmVkIGludCBwYXNpZCkKPj4+Pj4+Pj4gK3sKPj4+Pj4+Pj4gK8KgwqDCoCB1
bnNpZ25lZCBsb25nIGZsYWdzOwo+Pj4+Pj4+PiArwqDCoMKgIGludCByOwo+Pj4+Pj4+PiArCj4+
Pj4+Pj4+ICvCoMKgwqAgaWYgKCFwYXNpZCkKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biAwOwo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICsgc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnZtX21h
bmFnZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+Pj4+Pj4+PiArwqDCoMKgIHIgPSBpZHJfYWxsb2Mo
JmFkZXYtPnZtX21hbmFnZXIucGFzaWRfaWRyLCB2bSwgcGFzaWQsIAo+Pj4+Pj4+PiBwYXNpZCAr
IDEsCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfQVRPTUlDKTsKPj4+
Pj4+Pj4gKyBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xv
Y2ssIGZsYWdzKTsKPj4+Pj4+Pj4gK8KgwqDCoCBpZiAociA8IDApCj4+Pj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gcjsKPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArwqDCoMKgIHZtLT5wYXNpZCA9
IHBhc2lkOwo+Pj4+Pj4+PiArwqDCoMKgIHJldHVybiAwOwo+Pj4+Pj4+PiArfQo+Pj4+Pj4+PiAr
c3RhdGljIHZvaWQgYW1kZ3B1X3ZtX3Bhc2lkX3JlbW92ZV9pZChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB1bnNpZ25lZCBpbnQgcGFzaWQpCj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+ICvCoMKgwqAgdW5z
aWduZWQgbG9uZyBmbGFnczsKPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArwqDCoMKgIGlmICghcGFzaWQp
Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gKyBz
cGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2NrLCBmbGFncyk7Cj4+
Pj4+Pj4+ICvCoMKgwqAgaWRyX3JlbW92ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9pZHIsIHBh
c2lkKTsKPj4+Pj4+Pj4gKyBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT52bV9tYW5hZ2Vy
LnBhc2lkX2xvY2ssIGZsYWdzKTsKPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArfQo+Pj4+Pj4+PiArCj4+
Pj4+Pj4+ICtzdGF0aWMgdm9pZCBhbWRncHVfdm1fcGFzaWRfcmVtb3ZlKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LAo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBhbWRncHVfdm0gKnZtKQo+Pj4+Pj4+PiArewo+Pj4+Pj4+PiArwqDCoMKgIGFt
ZGdwdV92bV9wYXNpZF9yZW1vdmVfaWQoYWRldiwgdm0tPnBhc2lkKTsKPj4+Pj4+Pj4gK8KgwqDC
oCB2bS0+cGFzaWQgPSAwOwo+Pj4+Pj4+PiArfQo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICtzdGF0aWMg
dm9pZCBhbWRncHVfdm1fcGFzaWRfZnJlZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfdm0g
KnZtKQo+Pj4+Pj4+PiArewo+Pj4+Pj4+PiArwqDCoMKgIGlmICghdm0tPnBhc2lkKQo+Pj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICvCoMKgwqAgYW1k
Z3B1X3Bhc2lkX2ZyZWUodm0tPnBhc2lkKTsKPj4+Pj4+Pj4gK8KgwqDCoCBhbWRncHVfdm1fcGFz
aWRfcmVtb3ZlKGFkZXYsIHZtKTsKPj4+Pj4+Pj4gK30KPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArc3Rh
dGljIHN0cnVjdCBhbWRncHVfdm0gKmFtZGdwdV92bV9wYXNpZF9maW5kKHN0cnVjdCAKPj4+Pj4+
Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBwYXNpZCkKPj4+Pj4+Pj4g
K3sKPj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bTsKPj4+Pj4+Pj4gK8KgwqDC
oCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICsgc3Bpbl9sb2NrX2ly
cXNhdmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+Pj4+Pj4+PiArwqDC
oMKgIHZtID0gaWRyX2ZpbmQoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfaWRyLCBwYXNpZCk7Cj4+
Pj4+Pj4+ICsgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9s
b2NrLCBmbGFncyk7Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gK8KgwqDCoCByZXR1cm4gdm07Cj4+Pj4+
Pj4+ICt9Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gwqAgLyoKPj4+Pj4+Pj4gwqDCoCAqIHZtIGV2aWN0
aW9uX2xvY2sgY2FuIGJlIHRha2VuIGluIE1NVSBub3RpZmllcnMuIE1ha2Ugc3VyZSAKPj4+Pj4+
Pj4gbm8gcmVjbGFpbS1GUwo+Pj4+Pj4+PiDCoMKgICogaGFwcGVucyB3aGlsZSBob2xkaW5nIHRo
aXMgbG9jayBhbnl3aGVyZSB0byBwcmV2ZW50IAo+Pj4+Pj4+PiBkZWFkbG9ja3Mgd2hlbgo+Pj4+
Pj4+PiBAQCAtMjg1OSwxNyArMjkyMiwxNyBAQCBsb25nIGFtZGdwdV92bV93YWl0X2lkbGUoc3Ry
dWN0IAo+Pj4+Pj4+PiBhbWRncHVfdm0gKnZtLCBsb25nIHRpbWVvdXQpCj4+Pj4+Pj4+IMKgwqAg
Kgo+Pj4+Pj4+PiDCoMKgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+Pj4+Pj4+PiDC
oMKgICogQHZtOiByZXF1ZXN0ZWQgdm0KPj4+Pj4+Pj4gLSAqIEBwYXNpZDogUHJvY2VzcyBhZGRy
ZXNzIHNwYWNlIGlkZW50aWZpZXIKPj4+Pj4+Pj4gwqDCoCAqCj4+Pj4+Pj4+IMKgwqAgKiBJbml0
IEB2bSBmaWVsZHMuCj4+Pj4+Pj4+IMKgwqAgKgo+Pj4+Pj4+PiDCoMKgICogUmV0dXJuczoKPj4+
Pj4+Pj4gwqDCoCAqIDAgZm9yIHN1Y2Nlc3MsIGVycm9yIGZvciBmYWlsdXJlLgo+Pj4+Pj4+PiDC
oMKgICovCj4+Pj4+Pj4+IC1pbnQgYW1kZ3B1X3ZtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIHN0cnVjdCAKPj4+Pj4+Pj4gYW1kZ3B1X3ZtICp2bSwgdTMyIHBhc2lkKQo+Pj4+Pj4+
PiAraW50IGFtZGdwdV92bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3Qg
Cj4+Pj4+Pj4+IGFtZGdwdV92bSAqdm0pCj4+Pj4+Pj4+IMKgIHsKPj4+Pj4+Pj4gwqDCoMKgwqDC
oCBzdHJ1Y3QgYW1kZ3B1X2JvICpyb290X2JvOwo+Pj4+Pj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBh
bWRncHVfYm9fdm0gKnJvb3Q7Cj4+Pj4+Pj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IHBhc2lkOwo+
Pj4+Pj4+PiDCoMKgwqDCoMKgIGludCByLCBpOwo+Pj4+Pj4+PiDCoCDCoMKgwqDCoMKgIHZtLT52
YSA9IFJCX1JPT1RfQ0FDSEVEOwo+Pj4+Pj4+PiBAQCAtMjk0MCwxOSArMzAwMywxNSBAQCBpbnQg
YW1kZ3B1X3ZtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgCj4+Pj4+Pj4+ICphZGV2LCBzdHJ1
Y3QgYW1kZ3B1X3ZtICp2bSwgdTMyIHBhc2lkKQo+Pj4+Pj4+PiDCoCDCoMKgwqDCoMKgIGFtZGdw
dV9ib191bnJlc2VydmUodm0tPnJvb3QuYm8pOwo+Pj4+Pj4+PiDCoCAtwqDCoMKgIGlmIChwYXNp
ZCkgewo+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4+Pj4+
Pj4gLQo+Pj4+Pj4+PiAtIHNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lk
X2xvY2ssIGZsYWdzKTsKPj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHIgPSBpZHJfYWxsb2MoJmFk
ZXYtPnZtX21hbmFnZXIucGFzaWRfaWRyLCB2bSwgcGFzaWQsIAo+Pj4+Pj4+PiBwYXNpZCArIDEs
Cj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9BVE9NSUMp
Owo+Pj4+Pj4+PiAtIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnZtX21hbmFnZXIucGFz
aWRfbG9jaywgZmxhZ3MpOwo+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHIgPCAwKQo+Pj4+
Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycm9yX2ZyZWVfcm9vdDsKPj4+Pj4+
Pj4gLQo+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgdm0tPnBhc2lkID0gcGFzaWQ7Cj4+Pj4+Pj4+
ICvCoMKgwqAgcGFzaWQgPSBhbWRncHVfcGFzaWRfYWxsb2MoMTYpOwo+Pj4+Pj4+PiArwqDCoMKg
IGlmIChwYXNpZCA8IDApIHsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRldl93YXJuKGFkZXYt
PmRldiwgIk5vIG1vcmUgUEFTSURzIGF2YWlsYWJsZSEiKTsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIHBhc2lkID0gMDsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCB9Cj4+Pj4+Pj4+IMKgICvCoMKgwqAg
aWYgKGFtZGdwdV92bV9wYXNpZF9hbGxvYyhhZGV2LCB2bSwgcGFzaWQpKQo+Pj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgZ290byBlcnJvcl9mcmVlX3Bhc2lkOwo+Pj4+Pj4+PiArCj4+Pj4+Pj4+IMKg
wqDCoMKgwqAgSU5JVF9LRklGTyh2bS0+ZmF1bHRzKTsKPj4+Pj4+Pj4gwqAgwqDCoMKgwqDCoCBy
ZXR1cm4gMDsKPj4+Pj4+Pj4gQEAgLTI5NjAsNiArMzAxOSwxMCBAQCBpbnQgYW1kZ3B1X3ZtX2lu
aXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgCj4+Pj4+Pj4+ICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3Zt
ICp2bSwgdTMyIHBhc2lkKQo+Pj4+Pj4+PiDCoCBlcnJvcl91bnJlc2VydmU6Cj4+Pj4+Pj4+IMKg
wqDCoMKgwqAgYW1kZ3B1X2JvX3VucmVzZXJ2ZSh2bS0+cm9vdC5ibyk7Cj4+Pj4+Pj4+IMKgICtl
cnJvcl9mcmVlX3Bhc2lkOgo+Pj4+Pj4+PiArwqDCoMKgIGlmIChwYXNpZCkKPj4+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGFtZGdwdV9wYXNpZF9mcmVlKHBhc2lkKTsKPj4+Pj4+Pj4gKwo+Pj4+Pj4+
PiDCoCBlcnJvcl9mcmVlX3Jvb3Q6Cj4+Pj4+Pj4+IMKgwqDCoMKgwqAgYW1kZ3B1X2JvX3VucmVm
KCZyb290LT5zaGFkb3cpOwo+Pj4+Pj4+PiDCoMKgwqDCoMKgIGFtZGdwdV9ib191bnJlZigmcm9v
dF9ibyk7Cj4+Pj4+Pj4+IEBAIC0zMDM5LDE4ICszMTAyLDExIEBAIGludCBhbWRncHVfdm1fbWFr
ZV9jb21wdXRlKHN0cnVjdCAKPj4+Pj4+Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFt
ZGdwdV92bSAqdm0sCj4+Pj4+Pj4+IMKgwqDCoMKgwqAgaWYgKHIpCj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBnb3RvIHVucmVzZXJ2ZV9ibzsKPj4+Pj4+Pj4gwqAgLcKgwqDCoCBpZiAocGFz
aWQpIHsKPj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+Pj4+
Pj4+IC0KPj4+Pj4+Pj4gLSBzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNp
ZF9sb2NrLCBmbGFncyk7Cj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCByID0gaWRyX2FsbG9jKCZh
ZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2lkciwgdm0sIHBhc2lkLCAKPj4+Pj4+Pj4gcGFzaWQgKyAx
LAo+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfQVRPTUlD
KTsKPj4+Pj4+Pj4gLSBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT52bV9tYW5hZ2VyLnBh
c2lkX2xvY2ssIGZsYWdzKTsKPj4+Pj4+Pj4gK8KgwqDCoCByID0gYW1kZ3B1X3ZtX3Bhc2lkX2Fs
bG9jKGFkZXYsIHZtLCBwYXNpZCk7Cj4+Pj4+Pj4+ICvCoMKgwqAgaWYgKHIgPT3CoCAtRU5PU1BD
KQo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byB1bnJlc2VydmVfYm87Cj4+Pj4+Pj4+IMKg
IC3CoMKgwqDCoMKgwqDCoCBpZiAociA9PSAtRU5PU1BDKQo+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBnb3RvIHVucmVzZXJ2ZV9ibzsKPj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHIg
PSAwOwo+Pj4+Pj4+PiAtwqDCoMKgIH0KPj4+Pj4+Pj4gK8KgwqDCoCByID0gMDsKPj4+Pj4+Pj4g
wqAgwqDCoMKgwqDCoCAvKiBDaGVjayBpZiBQRCBuZWVkcyB0byBiZSByZWluaXRpYWxpemVkIGFu
ZCBkbyBpdCBiZWZvcmUKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgICogY2hhbmdpbmcgYW55IG90aGVy
IHN0YXRlLCBpbiBjYXNlIGl0IGZhaWxzLgo+Pj4+Pj4+PiBAQCAtMzA4OCwxOSArMzE0NCw3IEBA
IGludCBhbWRncHVfdm1fbWFrZV9jb21wdXRlKHN0cnVjdCAKPj4+Pj4+Pj4gYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sCj4+Pj4+Pj4+IMKgwqDCoMKgwqAgdm0tPmxh
c3RfdXBkYXRlID0gTlVMTDsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCB2bS0+aXNfY29tcHV0ZV9jb250
ZXh0ID0gdHJ1ZTsKPj4+Pj4+Pj4gwqAgLcKgwqDCoCBpZiAodm0tPnBhc2lkKSB7Cj4+Pj4+Pj4+
IC3CoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Pj4+Pj4+PiAtCj4+Pj4+Pj4+
IC0gc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgZmxhZ3Mp
Owo+Pj4+Pj4+PiAtIGlkcl9yZW1vdmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfaWRyLCB2bS0+
cGFzaWQpOwo+Pj4+Pj4+PiAtIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnZtX21hbmFn
ZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+Pj4+Pj4+PiAtCj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDC
oCAvKiBGcmVlIHRoZSBvcmlnaW5hbCBhbWRncHUgYWxsb2NhdGVkIHBhc2lkCj4+Pj4+Pj4+IC3C
oMKgwqDCoMKgwqDCoMKgICogV2lsbCBiZSByZXBsYWNlZCB3aXRoIGtmZCBhbGxvY2F0ZWQgcGFz
aWQKPj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqAgKi8KPj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKg
IGFtZGdwdV9wYXNpZF9mcmVlKHZtLT5wYXNpZCk7Cj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCB2
bS0+cGFzaWQgPSAwOwo+Pj4+Pj4+PiAtwqDCoMKgIH0KPj4+Pj4+Pj4gK8KgwqDCoCBhbWRncHVf
dm1fcGFzaWRfZnJlZShhZGV2LCB2bSk7Cj4+Pj4+Pj4+IMKgIMKgwqDCoMKgwqAgLyogRnJlZSB0
aGUgc2hhZG93IGJvIGZvciBjb21wdXRlIFZNICovCj4+Pj4+Pj4+IGFtZGdwdV9ib191bnJlZigm
dG9fYW1kZ3B1X2JvX3ZtKHZtLT5yb290LmJvKS0+c2hhZG93KTsKPj4+Pj4+Pj4gQEAgLTMxMTEs
MTMgKzMxNTUsOCBAQCBpbnQgYW1kZ3B1X3ZtX21ha2VfY29tcHV0ZShzdHJ1Y3QgCj4+Pj4+Pj4+
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLAo+Pj4+Pj4+PiDCoMKg
wqDCoMKgIGdvdG8gdW5yZXNlcnZlX2JvOwo+Pj4+Pj4+PiDCoCDCoCBmcmVlX2lkcjoKPj4+Pj4+
Pj4gLcKgwqDCoCBpZiAocGFzaWQpIHsKPj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHVuc2lnbmVk
IGxvbmcgZmxhZ3M7Cj4+Pj4+Pj4+ICvCoMKgwqAgYW1kZ3B1X3ZtX3Bhc2lkX3JlbW92ZV9pZChh
ZGV2LCBwYXNpZCk7Cj4+Pj4+Pj4+IMKgIC0gc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnZtX21h
bmFnZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+Pj4+Pj4+PiAtIGlkcl9yZW1vdmUoJmFkZXYtPnZt
X21hbmFnZXIucGFzaWRfaWRyLCBwYXNpZCk7Cj4+Pj4+Pj4+IC0gc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2NrLCBmbGFncyk7Cj4+Pj4+Pj4+IC3CoMKg
wqAgfQo+Pj4+Pj4+PiDCoCB1bnJlc2VydmVfYm86Cj4+Pj4+Pj4+IMKgwqDCoMKgwqAgYW1kZ3B1
X2JvX3VucmVzZXJ2ZSh2bS0+cm9vdC5ibyk7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIHI7
Cj4+Pj4+Pj4+IEBAIC0zMTMzLDE0ICszMTcyLDcgQEAgaW50IGFtZGdwdV92bV9tYWtlX2NvbXB1
dGUoc3RydWN0IAo+Pj4+Pj4+PiBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3Zt
ICp2bSwKPj4+Pj4+Pj4gwqDCoCAqLwo+Pj4+Pj4+PiDCoCB2b2lkIGFtZGdwdV92bV9yZWxlYXNl
X2NvbXB1dGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIAo+Pj4+Pj4+PiBzdHJ1Y3QgYW1k
Z3B1X3ZtICp2bSkKPj4+Pj4+Pj4gwqAgewo+Pj4+Pj4+PiAtwqDCoMKgIGlmICh2bS0+cGFzaWQp
IHsKPj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+Pj4+Pj4+
IC0KPj4+Pj4+Pj4gLSBzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9s
b2NrLCBmbGFncyk7Cj4+Pj4+Pj4+IC0gaWRyX3JlbW92ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNp
ZF9pZHIsIHZtLT5wYXNpZCk7Cj4+Pj4+Pj4+IC0gc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRl
di0+dm1fbWFuYWdlci5wYXNpZF9sb2NrLCBmbGFncyk7Cj4+Pj4+Pj4+IC3CoMKgwqAgfQo+Pj4+
Pj4+PiAtwqDCoMKgIHZtLT5wYXNpZCA9IDA7Cj4+Pj4+Pj4+ICvCoMKgwqAgYW1kZ3B1X3ZtX3Bh
c2lkX3JlbW92ZShhZGV2LCB2bSk7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqAgdm0tPmlzX2NvbXB1dGVf
Y29udGV4dCA9IGZhbHNlOwo+Pj4+Pj4+PiDCoCB9Cj4+Pj4+Pj4+IMKgIEBAIC0zMTY0LDE1ICsz
MTk2LDcgQEAgdm9pZCBhbWRncHVfdm1fZmluaShzdHJ1Y3QgCj4+Pj4+Pj4+IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtKQo+Pj4+Pj4+PiDCoCDCoMKgwqDCoMKgIHJv
b3QgPSBhbWRncHVfYm9fcmVmKHZtLT5yb290LmJvKTsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCBhbWRn
cHVfYm9fcmVzZXJ2ZShyb290LCB0cnVlKTsKPj4+Pj4+Pj4gLcKgwqDCoCBpZiAodm0tPnBhc2lk
KSB7Cj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Pj4+Pj4+
PiAtCj4+Pj4+Pj4+IC0gc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRf
bG9jaywgZmxhZ3MpOwo+Pj4+Pj4+PiAtIGlkcl9yZW1vdmUoJmFkZXYtPnZtX21hbmFnZXIucGFz
aWRfaWRyLCB2bS0+cGFzaWQpOwo+Pj4+Pj4+PiAtIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFk
ZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKg
wqAgdm0tPnBhc2lkID0gMDsKPj4+Pj4+Pj4gLcKgwqDCoCB9Cj4+Pj4+Pj4+IC0KPj4+Pj4+Pj4g
K8KgwqDCoCBhbWRncHVfdm1fcGFzaWRfcmVtb3ZlKGFkZXYsIHZtKTsKPj4+Pj4+Pj4gwqDCoMKg
wqDCoCBkbWFfZmVuY2Vfd2FpdCh2bS0+bGFzdF91bmxvY2tlZCwgZmFsc2UpOwo+Pj4+Pj4+PiDC
oMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQodm0tPmxhc3RfdW5sb2NrZWQpOwo+Pj4+Pj4+PiDCoCBA
QCAtMzMzNCwxNiArMzM1OCwxMCBAQCBpbnQgYW1kZ3B1X3ZtX2lvY3RsKHN0cnVjdCBkcm1fZGV2
aWNlIAo+Pj4+Pj4+PiAqZGV2LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHApCj4+
Pj4+Pj4+IMKgIHZvaWQgYW1kZ3B1X3ZtX2dldF90YXNrX2luZm8oc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIHUzMiAKPj4+Pj4+Pj4gcGFzaWQsCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV90YXNrX2luZm8gKnRhc2tfaW5mbykKPj4+Pj4+Pj4g
wqAgewo+Pj4+Pj4+PiAtwqDCoMKgIHN0cnVjdCBhbWRncHVfdm0gKnZtOwo+Pj4+Pj4+PiAtwqDC
oMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IGFtZGdwdV92
bSAqdm0gPSBhbWRncHVfdm1fcGFzaWRfZmluZChhZGV2LCBwYXNpZCk7Cj4+Pj4+Pj4+IMKgIC0g
c3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+
Pj4+Pj4+PiAtCj4+Pj4+Pj4+IC3CoMKgwqAgdm0gPSBpZHJfZmluZCgmYWRldi0+dm1fbWFuYWdl
ci5wYXNpZF9pZHIsIHBhc2lkKTsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCBpZiAodm0pCj4+Pj4+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCAqdGFza19pbmZvID0gdm0tPnRhc2tfaW5mbzsKPj4+Pj4+Pj4g
LQo+Pj4+Pj4+PiAtIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnZtX21hbmFnZXIucGFz
aWRfbG9jaywgZmxhZ3MpOwo+Pj4+Pj4+PiDCoCB9Cj4+Pj4+Pj4+IMKgIMKgIC8qKgo+Pj4+Pj4+
PiBAQCAtMzM4MCwyNCArMzM5OCwxNiBAQCBib29sIGFtZGdwdV92bV9oYW5kbGVfZmF1bHQoc3Ry
dWN0IAo+Pj4+Pj4+PiBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgcGFzaWQsCj4+Pj4+Pj4+IMKg
IHsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCBib29sIGlzX2NvbXB1dGVfY29udGV4dCA9IGZhbHNlOwo+
Pj4+Pj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfYm8gKnJvb3Q7Cj4+Pj4+Pj4+IC3CoMKg
wqAgdW5zaWduZWQgbG9uZyBpcnFmbGFnczsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCB1aW50NjRfdCB2
YWx1ZSwgZmxhZ3M7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV92bSAqdm07Cj4+
Pj4+Pj4+IMKgwqDCoMKgwqAgaW50IHI7Cj4+Pj4+Pj4+IMKgIC0gc3Bpbl9sb2NrX2lycXNhdmUo
JmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgaXJxZmxhZ3MpOwo+Pj4+Pj4+PiAtwqDCoMKg
IHZtID0gaWRyX2ZpbmQoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfaWRyLCBwYXNpZCk7Cj4+Pj4+
Pj4+IC3CoMKgwqAgaWYgKHZtKSB7Cj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCByb290ID0gYW1k
Z3B1X2JvX3JlZih2bS0+cm9vdC5ibyk7Cj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpc19jb21w
dXRlX2NvbnRleHQgPSB2bS0+aXNfY29tcHV0ZV9jb250ZXh0Owo+Pj4+Pj4+PiAtwqDCoMKgIH0g
ZWxzZSB7Cj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCByb290ID0gTlVMTDsKPj4+Pj4+Pj4gLcKg
wqDCoCB9Cj4+Pj4+Pj4+IC0gc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+dm1fbWFuYWdl
ci5wYXNpZF9sb2NrLCBpcnFmbGFncyk7Cj4+Pj4+Pj4+IC0KPj4+Pj4+Pj4gLcKgwqDCoCBpZiAo
IXJvb3QpCj4+Pj4+Pj4+ICvCoMKgwqAgdm0gPSBhbWRncHVfdm1fcGFzaWRfZmluZChhZGV2LCBw
YXNpZCk7Cj4+Pj4+Pj4+ICvCoMKgwqAgaWYgKCF2bSkKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiBmYWxzZTsKPj4+Pj4+Pj4gwqAgK8KgwqDCoCByb290ID0gYW1kZ3B1X2JvX3Jl
Zih2bS0+cm9vdC5ibyk7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpc19jb21wdXRlX2NvbnRl
eHQgPSB2bS0+aXNfY29tcHV0ZV9jb250ZXh0Owo+Pj4+Pj4+PiDCoMKgwqDCoMKgIGFkZHIgLz0g
QU1ER1BVX0dQVV9QQUdFX1NJWkU7Cj4+Pj4+Pj4+IMKgIMKgwqDCoMKgwqAgaWYgKGlzX2NvbXB1
dGVfY29udGV4dCAmJgo+Pj4+Pj4+PiBAQCAtMzQxMSwxMiArMzQyMSw4IEBAIGJvb2wgYW1kZ3B1
X3ZtX2hhbmRsZV9mYXVsdChzdHJ1Y3QgCj4+Pj4+Pj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUz
MiBwYXNpZCwKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyb3JfdW5yZWY7Cj4+
Pj4+Pj4+IMKgIMKgwqDCoMKgwqAgLyogRG91YmxlIGNoZWNrIHRoYXQgdGhlIFZNIHN0aWxsIGV4
aXN0cyAqLwo+Pj4+Pj4+PiAtIHNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT52bV9tYW5hZ2VyLnBh
c2lkX2xvY2ssIGlycWZsYWdzKTsKPj4+Pj4+Pj4gLcKgwqDCoCB2bSA9IGlkcl9maW5kKCZhZGV2
LT52bV9tYW5hZ2VyLnBhc2lkX2lkciwgcGFzaWQpOwo+Pj4+Pj4+PiAtwqDCoMKgIGlmICh2bSAm
JiB2bS0+cm9vdC5ibyAhPSByb290KQo+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgdm0gPSBOVUxM
Owo+Pj4+Pj4+PiAtIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnZtX21hbmFnZXIucGFz
aWRfbG9jaywgaXJxZmxhZ3MpOwo+Pj4+Pj4+PiAtwqDCoMKgIGlmICghdm0pCj4+Pj4+Pj4+ICvC
oMKgwqAgdm0gPSBhbWRncHVfdm1fcGFzaWRfZmluZChhZGV2LCBwYXNpZCk7Cj4+Pj4+Pj4+ICvC
oMKgwqAgaWYgKCF2bSB8fCAodm0gJiYgdm0tPnJvb3QuYm8gIT0gcm9vdCkpCj4+Pj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycm9yX3VubG9jazsKPj4+Pj4+Pj4gwqAgwqDCoMKgwqDC
oCBmbGFncyA9IEFNREdQVV9QVEVfVkFMSUQgfCBBTURHUFVfUFRFX1NOT09QRUQgfAo+Pj4+Pj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggCj4+
Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgKPj4+Pj4+Pj4g
aW5kZXggZGRiODVhODVjYmJhLi5lZTk5NGUyMWRmZmEgMTAwNjQ0Cj4+Pj4+Pj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oCj4+Pj4+Pj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oCj4+Pj4+Pj4+IEBAIC0zNzYsNyArMzc2
LDcgQEAgdm9pZCBhbWRncHVfdm1fbWFuYWdlcl9pbml0KHN0cnVjdCAKPj4+Pj4+Pj4gYW1kZ3B1
X2RldmljZSAqYWRldik7Cj4+Pj4+Pj4+IMKgIHZvaWQgYW1kZ3B1X3ZtX21hbmFnZXJfZmluaShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Cj4+Pj4+Pj4+IMKgIMKgIGxvbmcgYW1kZ3B1X3Zt
X3dhaXRfaWRsZShzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwgbG9uZyB0aW1lb3V0KTsKPj4+Pj4+Pj4g
LWludCBhbWRncHVfdm1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IAo+
Pj4+Pj4+PiBhbWRncHVfdm0gKnZtLCB1MzIgcGFzaWQpOwo+Pj4+Pj4+PiAraW50IGFtZGdwdV92
bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgCj4+Pj4+Pj4+IGFtZGdw
dV92bSAqdm0pOwo+Pj4+Pj4+PiDCoCBpbnQgYW1kZ3B1X3ZtX21ha2VfY29tcHV0ZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IAo+Pj4+Pj4+PiBhbWRncHVfdm0gKnZtLCB1MzIg
cGFzaWQpOwo+Pj4+Pj4+PiDCoCB2b2lkIGFtZGdwdV92bV9yZWxlYXNlX2NvbXB1dGUoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIAo+Pj4+Pj4+PiBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSk7Cj4+
Pj4+Pj4+IMKgIHZvaWQgYW1kZ3B1X3ZtX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IHN0cnVjdCAKPj4+Pj4+Pj4gYW1kZ3B1X3ZtICp2bSk7Cj4+Pj4+Pgo+Pj4+Cj4+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gYW1kLWdmeCBtYWls
aW5nIGxpc3QKPj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+PiBodHRwczovL25h
bTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZs
aXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtk
YXRhPTA0JTdDMDElN0NuaXJtb3kuZGFzJTQwYW1kLmNvbSU3Q2Y1ZDMxZWFjYmQzYjQ3MzM3MGVi
MDhkOTM0YTY1MzA1JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3
QzYzNzU5ODcxMTI0Njk3ODE4NCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdM
akF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0Mx
MDAwJmFtcDtzZGF0YT1DeWlpSFM5JTJCdUlYYXNWQnNkV1JVVVhHbXAlMkJ4RHVmb1cyNnN4ZVpy
aWtQNCUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPj4+Cj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngK
