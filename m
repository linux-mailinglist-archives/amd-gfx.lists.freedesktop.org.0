Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3311841970
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jan 2024 03:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B943A112BB5;
	Tue, 30 Jan 2024 02:41:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1F0112BB5
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jan 2024 02:41:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nS+lqdTcORQZ7iD6AIbSmdasw9CE1JMItSQoc0n9nu+EpoMNLmbEarcZCAOOn8fA1e+90ki4FYn7bt2A3++Ahi+EPwfOueUT3+Ae6fw7nznQaJEhyN4v4CvErVvB9YUzSTplwr1Kta4iKYJFhFbDLxkEWhexHlUgai/XsitobBKzUhuj2p5bjnNv2fT+Ay6nm+e/h5tp/ZWsCyimdF2pJKuUL/d+8tXggQAOezzUlL/yuM7y7c1ou+zfeqIBBDNb9ztLS3aMC2NwXUHU501KmgNPuRH8X0DTtndbn/YojCg2Cq/Z1ODyPDofPyx4eydcaYZ+oa6V9k/+acnQUxUBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sK7qvlRLDNX2Nu3zJqdVy6QnaqnIitWLdQ1pzXActjA=;
 b=cBhs1QYoGnxVpLYLMNAEXnC5oyQGUi7lJweHiSAoJ/cyzjKdXZco9D1Xl1taL4aqssSRisUFv2Wg/ZQEN4b8HPdFWc5VBZPCHyH32xR0C+L3HelZzizHwshTQ/m1/SDbBbIV72Bg7DzUBa9LvpDGJfIoQKo/lvoKSfVtRUTpvO1zqmaIl4rz/Y/Jeu9yr8I7diJAmEZVUYbV1aNVdH+eS/ptxyVmnjRV/iNpJStNwS4XfGdmadghX4ioGRl3lf8bjoIjI+P/opBTkgoYUi8umvT4PeytMpYg0Qx8W7Q8gLYfkUZCU20NbYliJYpJAwbjRO1nYkULsDj9gH4XKjgqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sK7qvlRLDNX2Nu3zJqdVy6QnaqnIitWLdQ1pzXActjA=;
 b=Cu7SFmIaaZ9fivf2MdA9ZQawM8DuGeLaWemfuP86LQ2i1QPSqKpKQspKJVpwOsdo3qcgtaASSbAwtnPP1vRBsuGQ3rRMhiqsM9CMOF+vq32WhI+44n373SQrljpXQaKxMIbiJtYFDf1zDFzJaefht4egq0eBmB1xV9IAc6/RI3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) by
 BL0PR12MB4913.namprd12.prod.outlook.com (2603:10b6:208:1c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 02:41:05 +0000
Received: from DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::831c:60ba:97df:9720]) by DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::831c:60ba:97df:9720%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 02:41:05 +0000
Message-ID: <ab1a90df-2b05-46bf-8ead-30700565fc0c@amd.com>
Date: Tue, 30 Jan 2024 10:40:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fix the warning info in mode1 reset
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20240125161514.436188-1-alexander.deucher@amd.com>
 <BL1PR12MB5144C965BBBD655E8F722A8DF77E2@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Language: en-US
From: "Ma, Jun" <majun@amd.com>
In-Reply-To: <BL1PR12MB5144C965BBBD655E8F722A8DF77E2@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To DM4PR12MB6351.namprd12.prod.outlook.com
 (2603:10b6:8:a2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6351:EE_|BL0PR12MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b73c47-f469-4b05-b6c3-08dc213ce7ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s/5TE2T1D1KOPoTo2quUYJwkJbPEZ4nGWTmBQW8djljmSqYeOONYkLayivfrB4rd6WxwIuKnVQ9JHL5VZF+om3rnQruygMFVFQ/KxrC9I5cTWDCIftpqDmzDkxpiKsCmvW3G7ygVuKOyRGqtHnCjwQtLjKgARzriOjjBtYF0VAXHwrbe7udT2jVbmkwCfby6MnV7PPfAMXf7kBub1XsXgTdGJMYPfI6wqhVy2Mn8DiElZikJPpwvWd9IYpa7Ev9b6PFyLyavsUiywWYY6QI7G8WgnLFgHSWSqwTBxrkl8b3DMeMmjR2fgWcJaYp5CJOUKEbx2+DFFxlVvjIPbxlSeSGzEz1IFnDfKlvGK7GUoMrZqba3x61BhoYEjXL3NqxIICERQrrfk39fCwqo6aB/U/6QYeUJj7TqHPNse+AORNOgKzOTCRrd26uZY9ve4bONrE3PXV1460oOVke9muTso0dbHmvtvVEjYOFg3g/SXuOv1Pay15yRhvLsiypsUepLlv65DWyw2EnN8VrgffRhGOT4nQ6xmQUy3A451vZjhfct/fTX1aeMTpozPJTt1drozARp4Mcil5G/GmUyD/EYib7H0npi9fy2jUGB2cUFssNj2CGkEq0U+J1SqQrDnw2tPiDd3rjAUOkJFJzfs1rWbd8WtDpbpjakO74M7akjR8YVyuFva8+ATRC9xgEaN95o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6351.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(136003)(376002)(396003)(230273577357003)(230922051799003)(230173577357003)(186009)(64100799003)(451199024)(1800799012)(31686004)(26005)(6666004)(6512007)(6506007)(53546011)(83380400001)(36756003)(31696002)(5660300002)(2616005)(4326008)(41300700001)(8936002)(38100700002)(66946007)(8676002)(110136005)(66476007)(66556008)(6486002)(2906002)(54906003)(478600001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1BOZlVmdlBUOHhsK2NCb1ZEZitqVmlPZERsc0JxWDNsNFkrNmFqY2lybE4r?=
 =?utf-8?B?MFd1UW15eHkzZndsTjJSaytOMGI1RVNZak9zVVEvdWw2NnBic2FLenRyUWdr?=
 =?utf-8?B?V25pTE1Va1Z3bHR5ZVFVSmEycm5pL0FwK0FvSEdCMnMvU2V3N0dIZG9EU0ta?=
 =?utf-8?B?akxGTDR0NUlPaFNCU0FzdHZJNlE3dXd3MEtkM3djaUJtRm5yVURtWmw4WmZN?=
 =?utf-8?B?eUJOUzJxQUFVSnpHU0ppM1dESnZobUU2TGZBaVhTNHBYNUI5WXBCU1I2d2hE?=
 =?utf-8?B?YlptU2Z6a0RjR0h2WmliWXk4RCtsZ284SXB3MzJmRVo1UmtvTUsxUkJXOHFX?=
 =?utf-8?B?bU1DdGR6N2xUa2pwR1dBWnRmbkRuV0p0aEdoNElYZDNiRTVFV0lMNzYvVHFl?=
 =?utf-8?B?aUYvMmpRbWk3UVVVemRQUW1FSmNFUVNmejZjbFJvN1NuME1CbTlnU0NVbG9N?=
 =?utf-8?B?NGZsdTlrWXYvczQwYTJXczNlVmQrSkI1VXM1b3N2QWs0a2g0N24zWTBoZHZr?=
 =?utf-8?B?eWEwNEhOTXQ2ZVFNWm9wZ3ZQMkpMeER6RjlmcHhReERUVjFuM0NFQS9WeXF3?=
 =?utf-8?B?bmt5OWpDMGI1Um9HOXlpbHoxSXdTbHk2ekhxSm44VzU0WGlVRnpZaVIyUUJS?=
 =?utf-8?B?TnU5ejRoSktHbUdVbm5nNldiU21wREErLzNYMG04dHgrc1BWQWJkYnVQbEdF?=
 =?utf-8?B?cW5pcm8rZXpnM2QrWUJDeG1POVRLZnRmeG00bEpScGZNYUVtYU1hV0Z4amtD?=
 =?utf-8?B?bGcyc2dXK3JNdERQZDFmdFZsNHdUK1AwUlR1V0wxQmhqQlFoVWpPT2lsWlNh?=
 =?utf-8?B?emVoQXJRYm05MWRBS0V4R0RpYng2WkYzem04K3ArL1ByL1VOd3BwbkErdjFN?=
 =?utf-8?B?eUtlRWYraSt6K2s2V3E0YkVRRzJVeG4weFFrcWdvM1VFeWVOLzkvV2xFbHNn?=
 =?utf-8?B?WnpWVjRTM3VIU1B2Y00rWU5ReHZpaUtYK2tPR1FDblFFRVdYRGNqOGUvQkhI?=
 =?utf-8?B?K3c0SGs0K1BHc28zeHBZMEk1all4bkE0Z3hOMXV0QnYzOFZJSHhYbkI3Y296?=
 =?utf-8?B?dktoOXhUN1JkOWhHUDhMUnNrQS9JQ2hlT2NRUEhjM0JTY01sV2dvaldHQnhU?=
 =?utf-8?B?UndtclFUZG5JS0QyOGxGS0tTdUd6UFVmNldIWHJFS3V4VFBEbkdzVGhtaU81?=
 =?utf-8?B?cWZIdFU1ejRSMDN0VkY2YlhzNE9COWRFc1lxRFV5MTRoU1J5T1BTM2YvOUJh?=
 =?utf-8?B?T2pHakFJZmdJalEzN3YzVndjWDBBdk5QRjd6QWsydnMyMkNNNGRwWU9vaWpu?=
 =?utf-8?B?YWdqKzl0SUE5L1hLN1k3ek5WNi8xckd0UTJkOVJUc3NrMy9tRHZoM3lLQUxu?=
 =?utf-8?B?QzZpTTZ1d2lZbU1tM0E0a3lyNFdjY3pxLzZvTit5cmJpR280TThRemFEaUN1?=
 =?utf-8?B?Qm94L1RVbHdIYjFsNERSOFF4YzJid3U5dURCaGM1RjZLWThBdWNFV1l3VVAz?=
 =?utf-8?B?emxZKzVUNVA0a1N6cy9FQ2g4VEVjY1ZUUXZQSGtpR3F3N0I4c2hoblBidnNy?=
 =?utf-8?B?MzgvQTJRVGFKZEwrV1o5a3F1Wkx4R2o2LzRtNlVwWk9Xa2dVa1B2TkY4QnFu?=
 =?utf-8?B?UWlwcE80M2cyQW1oWWNZQUJuV0JvdWlyUlRCYVJwaUFDQi9KT0ZlME5DMXJP?=
 =?utf-8?B?RCszYk03SW5xQTVzQWt2Y2lINVVIcjdpOWN4UUl4dmU1NFVYamhEMlhFc2ph?=
 =?utf-8?B?dy8ySlpLV2ZOUmUvQTFkMmtWQzFkOUJXblFQa3V2RzJvRU53eStlM2F2cXhs?=
 =?utf-8?B?THBrR0g1V2xITTZDcnc3N2lTZnVDZHd4S01icS83Yk12TFVNMkdXdnVxZ012?=
 =?utf-8?B?dnN1dnlZQ05OM3B6SGJUaXRkaGNQWlJiVUNTa2pRbGxQMjdZYWJwUVhrUitt?=
 =?utf-8?B?ZUt2bzd2MkJXT3N0MlVpbDNwdU56VXcvTUd3dnh3UGpMOTZ4b2drWTZVMTZB?=
 =?utf-8?B?WW1vQ0UrUXZFK2V1UHJDOUxCZklTRU9HM2JJNVNpMzdqSmp4Y3lKUzdXMklP?=
 =?utf-8?B?UW8ya0hpZ0RJNzYvQmg3K1RtZW04bk1DYm5pODlPZlo0NzM1d2NwbWsrM0dQ?=
 =?utf-8?Q?37xVDVs74d512X62Z5kUsTc4t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b73c47-f469-4b05-b6c3-08dc213ce7ee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6351.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 02:41:05.5846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qC8ZpyVV7j32h5+pALO/T5vqxAZ3erGPKkEFdHpa6ZBuM0mgFiBPmIFgdhIjPHw+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4913
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
Cc: "Ma, Jun" <Jun.Ma2@amd.com>, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IE1hIEp1biA8SnVuLk1hMkBhbWQuY29tPg0KDQpSZWdhcmRzLA0KTWEgSnVu
DQoNCk9uIDEvMjkvMjAyNCAxMTozMyBQTSwgRGV1Y2hlciwgQWxleGFuZGVyIHdyb3RlOg0KPiBb
QU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJhbF0NCj4gDQo+IA0KPiBQaW5nPw0KPiANCj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICpGcm9tOiogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4
YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KPiAqU2VudDoqIFRodXJzZGF5LCBKYW51YXJ5IDI1LCAy
MDI0IDExOjE1IEFNDQo+ICpUbzoqIGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4NCj4gKkNjOiogTWEsIEp1biA8SnVuLk1hMkBhbWQu
Y29tPjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgUHJv
c3lhaywgVml0YWx5IDxWaXRhbHkuUHJvc3lha0BhbWQuY29tPg0KPiAqU3ViamVjdDoqIFtQQVRD
SF0gZHJtL2FtZGdwdTogRml4IHRoZSB3YXJuaW5nIGluZm8gaW4gbW9kZTEgcmVzZXQNCj4gwqAN
Cj4gRnJvbTogTWEgSnVuIDxKdW4uTWEyQGFtZC5jb20+DQo+IA0KPiBGaXggdGhlIHdhcm5pbmcg
aW5mbyBiZWxvdyBkdXJpbmcgbW9kZTEgcmVzZXQuDQo+IFvCoCArMC4wMDAwMDRdIENhbGwgVHJh
Y2U6DQo+IFvCoCArMC4wMDAwMDRdwqAgPFRBU0s+DQo+IFvCoCArMC4wMDAwMDZdwqAgPyBzaG93
X3JlZ3MrMHg2ZS8weDgwDQo+IFvCoCArMC4wMDAwMTFdwqAgPyBfX2ZsdXNoX3dvcmsuaXNyYS4w
KzB4MmU4LzB4MzkwDQo+IFvCoCArMC4wMDAwMDVdwqAgPyBfX3dhcm4rMHg5MS8weDE1MA0KPiBb
wqAgKzAuMDAwMDA5XcKgID8gX19mbHVzaF93b3JrLmlzcmEuMCsweDJlOC8weDM5MA0KPiBbwqAg
KzAuMDAwMDA2XcKgID8gcmVwb3J0X2J1ZysweDE5ZC8weDFiMA0KPiBbwqAgKzAuMDAwMDEzXcKg
ID8gaGFuZGxlX2J1ZysweDQ2LzB4ODANCj4gW8KgICswLjAwMDAxMl3CoCA/IGV4Y19pbnZhbGlk
X29wKzB4MWQvMHg4MA0KPiBbwqAgKzAuMDAwMDExXcKgID8gYXNtX2V4Y19pbnZhbGlkX29wKzB4
MWYvMHgzMA0KPiBbwqAgKzAuMDAwMDE0XcKgID8gX19mbHVzaF93b3JrLmlzcmEuMCsweDJlOC8w
eDM5MA0KPiBbwqAgKzAuMDAwMDA3XcKgID8gX19mbHVzaF93b3JrLmlzcmEuMCsweDIwOC8weDM5
MA0KPiBbwqAgKzAuMDAwMDA3XcKgID8gX3ByYl9yZWFkX3ZhbGlkKzB4MjE2LzB4MjkwDQo+IFvC
oCArMC4wMDAwMDhdwqAgX19jYW5jZWxfd29ya190aW1lcisweDExZC8weDFhMA0KPiBbwqAgKzAu
MDAwMDA3XcKgID8gdHJ5X3RvX2dyYWJfcGVuZGluZysweGU4LzB4MTkwDQo+IFvCoCArMC4wMDAw
MTJdwqAgY2FuY2VsX3dvcmtfc3luYysweDE0LzB4MjANCj4gW8KgICswLjAwMDAwOF3CoCBhbWRk
cm1fc2NoZWRfc3RvcCsweDNjLzB4MWQwIFthbWRfc2NoZWRdDQo+IFvCoCArMC4wMDAwMzJdwqAg
YW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcisweDI5YS8weGU5MCBbYW1kZ3B1XQ0KPiANCj4gVGhp
cyB3YXJuaW5nIGluZm8gd2FzIHByaW50ZWQgYWZ0ZXIgYXBwbHlpbmcgdGhlIHBhdGNoDQo+ICJk
cm0vc2NoZWQ6IENvbnZlcnQgZHJtIHNjaGVkdWxlciB0byB1c2UgYSB3b3JrIHF1ZXVlIHJhdGhl
ciB0aGFuIGt0aHJlYWQiLg0KPiBUaGUgcm9vdCBjYXVzZSBpcyB0aGF0IGFtZGdwdSBkcml2ZXIg
dHJpZXMgdG8gdXNlIHRoZSB1bmluaXRpYWxpemVkDQo+IHdvcmtfc3RydWN0IGluIHRoZSBzdHJ1
Y3QgZHJtX2dwdV9zY2hlZHVsZXINCj4gDQo+IHYyOg0KPiDCoC0gUmVuYW1lIHRoZSBmdW5jdGlv
biB0byBhbWRncHVfcmluZ19zY2hlZF9yZWFkeSBhbmQgbW92ZSBpdCB0bw0KPiBhbWRncHVfcmlu
Zy5jIChBbGV4KQ0KPiB2MzoNCj4gLSBGaXggYSBmZXcgbW9yZSBjaGVja3MgYmFzZWQgb24gVml0
YWx5J3MgcGF0Y2ggKEFsZXgpDQo+IA0KPiBGaXhlczogMTFiM2I5ZjQ2MWM1ICgiZHJtL3NjaGVk
OiBDaGVjayBzY2hlZHVsZXIgcmVhZHkgYmVmb3JlIGNhbGxpbmcgdGltZW91dCBoYW5kbGluZyIp
DQo+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IFZpdGFseSBQcm9zeWFrIDx2aXRhbHkucHJvc3lha0BhbWQuY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBNYSBKdW4gPEp1bi5NYTJAYW1kLmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAtLS0NCj4g
wqAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfYXJjdHVydXMuY8KgwqDCoCB8
wqAgMiArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmPC
oMKgwqDCoMKgwqDCoCB8wqAgOCArKysrLS0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuY8KgwqDCoMKgwqDCoMKgwqAgfCAxMiArKysrKystLS0tLS0NCj4g
wqBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5jwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAxNCArKysrKysrKysrKysrLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yaW5nLmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQ0KPiDCoDUgZmlsZXMg
Y2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9hcmN0dXJ1cy5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9hcmN0dXJ1cy5jDQo+
IGluZGV4IDg5OWUzMWUzYTVlOC4uM2EzZjNjZTA5ZjAwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2FyY3R1cnVzLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9hcmN0dXJ1cy5jDQo+IEBAIC0y
OTAsNyArMjkwLDcgQEAgc3RhdGljIGludCBzdXNwZW5kX3Jlc3VtZV9jb21wdXRlX3NjaGVkdWxl
cihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgYm9vbCBzdXMNCj4gwqDCoMKgwqDCoMKgwqDC
oCBmb3IgKGkgPSAwOyBpIDwgYWRldi0+Z2Z4Lm51bV9jb21wdXRlX3JpbmdzOyBpKyspIHsNCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5n
ID0gJmFkZXYtPmdmeC5jb21wdXRlX3JpbmdbaV07DQo+IMKgDQo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmICghKHJpbmcgJiYgZHJtX3NjaGVkX3dxdWV1ZV9yZWFkeSgmcmluZy0+
c2NoZWQpKSkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFhbWRncHVfcmlu
Z19zY2hlZF9yZWFkeShyaW5nKSkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOw0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAvKiBzdG9wIHNlY2hlZHVsZXIgYW5kIGRyYWluIHJpbmcuICovDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYw0KPiBpbmRleCBlNDg1ZGQz
MzU3YzYuLjFhZmJiMmU5MzJjNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RlYnVnZnMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGVidWdmcy5jDQo+IEBAIC0xNjc4LDcgKzE2NzgsNyBAQCBzdGF0aWMgaW50IGFt
ZGdwdV9kZWJ1Z2ZzX3Rlc3RfaWJfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKnVudXNl
ZCkNCj4gwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX01BWF9SSU5HUzsg
aSsrKSB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVf
cmluZyAqcmluZyA9IGFkZXYtPnJpbmdzW2ldOw0KPiDCoA0KPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoIXJpbmcgfHwgIWRybV9zY2hlZF93cXVldWVfcmVhZHkoJnJpbmctPnNj
aGVkKSkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFhbWRncHVfcmluZ19z
Y2hlZF9yZWFkeShyaW5nKSkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbnRpbnVlOw0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkcm1fc2NoZWRfd3F1ZXVlX3N0b3AoJnJpbmctPnNjaGVkKTsNCj4gwqDCoMKgwqDCoMKgwqDC
oCB9DQo+IEBAIC0xNjk0LDcgKzE2OTQsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZWJ1Z2ZzX3Rl
c3RfaWJfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKnVudXNlZCkNCj4gwqDCoMKgwqDC
oMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX01BWF9SSU5HUzsgaSsrKSB7DQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfcmluZyAqcmluZyA9IGFk
ZXYtPnJpbmdzW2ldOw0KPiDCoA0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
IXJpbmcgfHwgIWRybV9zY2hlZF93cXVldWVfcmVhZHkoJnJpbmctPnNjaGVkKSkNCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFhbWRncHVfcmluZ19zY2hlZF9yZWFkeShyaW5n
KSkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bnRpbnVlOw0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fc2NoZWRfd3F1
ZXVlX3N0YXJ0KCZyaW5nLT5zY2hlZCk7DQo+IMKgwqDCoMKgwqDCoMKgwqAgfQ0KPiBAQCAtMTkx
Niw4ICsxOTE2LDggQEAgc3RhdGljIGludCBhbWRncHVfZGVidWdmc19pYl9wcmVlbXB0KHZvaWQg
KmRhdGEsIHU2NCB2YWwpDQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqAgcmluZyA9IGFkZXYtPnJp
bmdzW3ZhbF07DQo+IMKgDQo+IC3CoMKgwqDCoMKgwqAgaWYgKCFyaW5nIHx8ICFyaW5nLT5mdW5j
cy0+cHJlZW1wdF9pYiB8fA0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqAgIWRybV9zY2hlZF93cXVl
dWVfcmVhZHkoJnJpbmctPnNjaGVkKSkNCj4gK8KgwqDCoMKgwqDCoCBpZiAoIWFtZGdwdV9yaW5n
X3NjaGVkX3JlYWR5KHJpbmcpIHx8DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAhcmluZy0+ZnVu
Y3MtPnByZWVtcHRfaWIpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biAtRUlOVkFMOw0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgIC8qIHRoZSBsYXN0IHByZWVtcHRp
b24gZmFpbGVkICovDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMNCj4gaW5kZXggMWEwNGNjYmE5NTQyLi43ZmYxN2RmN2E1Y2UgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gQEAgLTUwNDIsNyArNTA0Miw3
IEBAIGJvb2wgYW1kZ3B1X2RldmljZV9oYXNfam9iX3J1bm5pbmcoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpDQo+IMKgwqDCoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IEFNREdQVV9NQVhf
UklOR1M7ICsraSkgew0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
YW1kZ3B1X3JpbmcgKnJpbmcgPSBhZGV2LT5yaW5nc1tpXTsNCj4gwqANCj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFyaW5nIHx8ICFkcm1fc2NoZWRfd3F1ZXVlX3JlYWR5KCZy
aW5nLT5zY2hlZCkpDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghYW1kZ3B1
X3Jpbmdfc2NoZWRfcmVhZHkocmluZykpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZyaW5nLT5zY2hlZC5qb2JfbGlzdF9sb2NrKTsNCj4g
QEAgLTUxODEsNyArNTE4MSw3IEBAIGludCBhbWRncHVfZGV2aWNlX3ByZV9hc2ljX3Jlc2V0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiDCoMKgwqDCoMKgwqDCoMKgIGZvciAoaSA9IDA7
IGkgPCBBTURHUFVfTUFYX1JJTkdTOyArK2kpIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0gYWRldi0+cmluZ3NbaV07DQo+IMKg
DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghcmluZyB8fCAhZHJtX3NjaGVk
X3dxdWV1ZV9yZWFkeSgmcmluZy0+c2NoZWQpKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoIWFtZGdwdV9yaW5nX3NjaGVkX3JlYWR5KHJpbmcpKQ0KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7DQo+IMKgDQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIENsZWFyIGpvYiBmZW5jZSBmcm9tIGZl
bmNlIGRydiB0byBhdm9pZCBmb3JjZV9jb21wbGV0aW9uDQo+IEBAIC01NjQ4LDcgKzU2NDgsNyBA
QCBpbnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IEFN
REdQVV9NQVhfUklOR1M7ICsraSkgew0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0gdG1wX2FkZXYtPnJp
bmdzW2ldOw0KPiDCoA0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKCFyaW5nIHx8ICFkcm1fc2NoZWRfd3F1ZXVlX3JlYWR5KCZyaW5nLT5zY2hlZCkp
DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWFt
ZGdwdV9yaW5nX3NjaGVkX3JlYWR5KHJpbmcpKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOw0KPiDCoA0K
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX3Nj
aGVkX3N0b3AoJnJpbmctPnNjaGVkLCBqb2IgPyAmam9iLT5iYXNlIDogTlVMTCk7DQo+IEBAIC01
NzE3LDcgKzU3MTcsNyBAQCBpbnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9y
IChpID0gMDsgaSA8IEFNREdQVV9NQVhfUklOR1M7ICsraSkgew0KPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5n
ID0gdG1wX2FkZXYtPnJpbmdzW2ldOw0KPiDCoA0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFyaW5nIHx8ICFkcm1fc2NoZWRfd3F1ZXVlX3JlYWR5
KCZyaW5nLT5zY2hlZCkpDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoIWFtZGdwdV9yaW5nX3NjaGVkX3JlYWR5KHJpbmcpKQ0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bnRpbnVlOw0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZHJtX3NjaGVkX3N0YXJ0KCZyaW5nLT5zY2hlZCwgdHJ1ZSk7DQo+IEBAIC02MDcy
LDcgKzYwNzIsNyBAQCBwY2lfZXJzX3Jlc3VsdF90IGFtZGdwdV9wY2lfZXJyb3JfZGV0ZWN0ZWQo
c3RydWN0IHBjaV9kZXYgKnBkZXYsIHBjaV9jaGFubmVsX3N0YQ0KPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX01BWF9SSU5HUzsgKytpKSB7
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSBhZGV2LT5yaW5nc1tpXTsNCj4gwqANCj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghcmluZyB8fCAhZHJtX3Nj
aGVkX3dxdWV1ZV9yZWFkeSgmcmluZy0+c2NoZWQpKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFhbWRncHVfcmluZ19zY2hlZF9yZWFkeShyaW5n
KSkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRybV9zY2hlZF9zdG9wKCZyaW5nLT5zY2hlZCwgTlVM
TCk7DQo+IEBAIC02MjE0LDcgKzYyMTQsNyBAQCB2b2lkIGFtZGdwdV9wY2lfcmVzdW1lKHN0cnVj
dCBwY2lfZGV2ICpwZGV2KQ0KPiDCoMKgwqDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBBTURH
UFVfTUFYX1JJTkdTOyArK2kpIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0gYWRldi0+cmluZ3NbaV07DQo+IMKgDQo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghcmluZyB8fCAhZHJtX3NjaGVkX3dxdWV1ZV9y
ZWFkeSgmcmluZy0+c2NoZWQpKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
IWFtZGdwdV9yaW5nX3NjaGVkX3JlYWR5KHJpbmcpKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7DQo+IMKgDQo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRybV9zY2hlZF9zdGFydCgmcmluZy0+c2NoZWQsIHRydWUp
Ow0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jpbmcu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmMNCj4gaW5kZXggNDU0
MjRlYmY5NjgxLi45YWUzODZlOWQ0MWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3JpbmcuYw0KPiBAQCAtNjM0LDcgKzYzNCw4IEBAIGludCBhbWRncHVfcmluZ190
ZXN0X2hlbHBlcihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpDQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIERSTV9ERVZfREVCVUcoYWRldi0+ZGV2LCAicmluZyB0ZXN0IG9uICVz
IHN1Y2NlZWRlZFxuIiwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJpbmctPm5hbWUpOw0KPiDCoA0KPiAtwqDCoMKgwqDCoMKg
IHJpbmctPnNjaGVkLnJlYWR5ID0gIXI7DQo+ICvCoMKgwqDCoMKgwqAgaWYgKCFyaW5nLT5ub19z
Y2hlZHVsZXIpDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJpbmctPnNjaGVkLnJl
YWR5ID0gIXI7DQo+IMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHI7DQo+IMKgfQ0KPiDCoA0KPiBA
QCAtNzE3LDMgKzcxOCwxNCBAQCB2b2lkIGFtZGdwdV9yaW5nX2liX29uX2VtaXRfZGUoc3RydWN0
IGFtZGdwdV9yaW5nICpyaW5nKQ0KPiDCoMKgwqDCoMKgwqDCoMKgIGlmIChyaW5nLT5pc19zd19y
aW5nKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhbWRncHVfc3dfcmluZ19p
Yl9tYXJrX29mZnNldChyaW5nLCBBTURHUFVfTVVYX09GRlNFVF9UWVBFX0RFKTsNCj4gwqB9DQo+
ICsNCj4gK2Jvb2wgYW1kZ3B1X3Jpbmdfc2NoZWRfcmVhZHkoc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nKQ0KPiArew0KPiArwqDCoMKgwqDCoMKgIGlmICghcmluZykNCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOw0KPiArDQo+ICvCoMKgwqDCoMKgwqAgaWYgKHJp
bmctPm5vX3NjaGVkdWxlciB8fCAhZHJtX3NjaGVkX3dxdWV1ZV9yZWFkeSgmcmluZy0+c2NoZWQp
KQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7DQo+ICsNCj4g
K8KgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsNCj4gK30NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmluZy5oDQo+IGluZGV4IGJiYjUzNzIwYTAxOC4uZmUxYTYxZWI2ZTRjIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmgNCj4gQEAgLTQ1
MCw1ICs0NTAsNSBAQCBpbnQgYW1kZ3B1X2liX3NjaGVkdWxlKHN0cnVjdCBhbWRncHVfcmluZyAq
cmluZywgdW5zaWduZWQgbnVtX2licywNCj4gwqBpbnQgYW1kZ3B1X2liX3Bvb2xfaW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+IMKgdm9pZCBhbWRncHVfaWJfcG9vbF9maW5pKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsNCj4gwqBpbnQgYW1kZ3B1X2liX3JpbmdfdGVzdHMo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAtDQo+ICtib29sIGFtZGdwdV9yaW5nX3Nj
aGVkX3JlYWR5KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZyk7DQo+IMKgI2VuZGlmDQo+IC0tIA0K
PiAyLjQyLjANCj4gDQo=
