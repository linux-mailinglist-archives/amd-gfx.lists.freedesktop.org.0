Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC67437FE2F
	for <lists+amd-gfx@lfdr.de>; Thu, 13 May 2021 21:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DF26EDAD;
	Thu, 13 May 2021 19:35:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2050.outbound.protection.outlook.com [40.107.96.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386236EDAD
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 May 2021 19:35:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9Pw4qqY2/nnFWSZP7rSEjcHsAnhqBqYarqY+YURWDrAORK5KUa2qYDcPsubrMohNluRRXsZW3CeP/5//hdToA6X44xVMJH/FgRXhDVd6R7zXospCy8K2Ep8cQ2yS79EYBqFhYprB92Vl7N10U8ZAOms7Sy6DQmfuWqN/J10Pqaym5D9qG5EPaLVjMqs574KCQSOpQ6tSkd4jJ/8vB6G6WtkEW9ijunoNDL9J5R1IDBryeLMWK9cbMqvNQia2gI8NwBXFLfVLXiZMV8lDZmMUKfN/mpVp6Va1Fdmr/sSp/d3ko0xhJf9OGdatouVld9rC86VAmI1sgP7XDpXA3qXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmV/7M8Ct+g2KN4qrvU85lX++UVR6MKRkUPTlontnHo=;
 b=Artw60Xw3/2EhCrVIV8soqE45GcjjRu+T3kBpsuCItgOfcglMDjUlm8anqxVeHgZiodSCSOelV3ReXWmbTZQ9fNvfaScAZO3h22EoevFlFZMyTrpwfpIbO+URsqJ6kI3KmhzX10rltVY1z1JVIimHBl40kQCc5xF1qvnCg2CUrq5oyjxDMhab4aTbTviox/KwqKaxdndo/SkEMjYQpYneF3NlVd6vlV2t2q9ceqE3/e5rtO4vfULnsjwdR8qT49ZK3K0y8JMWYnzheov+IDMjKU9ZyRS1Vs+zslY+PJ/MU7rPRf8bIqt7+dR3/aCqbt9ODWGqGmPKlhu53l7/H9KJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmV/7M8Ct+g2KN4qrvU85lX++UVR6MKRkUPTlontnHo=;
 b=Y7aYZMIFaP9K0JK5dAireWAZYTiH55VVXSxoEby3B/RM2fTsRYpVAwG9+eB5qfs6byAbIntRXcMwzK5XmtF4mBSGVgA67M4yGADSCCkQfyL7OMv2B+9IcvAqWj894//IlD8PTE3w1ViSHu1GsKVDMDneEsPgYi0v4MWJtbOVTss=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR1201MB2505.namprd12.prod.outlook.com (2603:10b6:3:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30; Thu, 13 May
 2021 19:35:02 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::142:82e3:7e9d:55a0]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::142:82e3:7e9d:55a0%6]) with mapi id 15.20.4129.026; Thu, 13 May 2021
 19:35:01 +0000
Subject: Re: [PATCH 2/2] drm/amdgpu: Poll of RAS errors asynchronously
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org
References: <20210512170302.64951-1-luben.tuikov@amd.com>
 <20210512170302.64951-2-luben.tuikov@amd.com>
 <83e2151b-02aa-a055-2d37-4f74ea025f3d@gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <b7b30d81-1544-6b81-1bc2-23dd51dc88f3@amd.com>
Date: Thu, 13 May 2021 15:34:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <83e2151b-02aa-a055-2d37-4f74ea025f3d@gmail.com>
Content-Language: en-CA
X-Originating-IP: [108.162.138.69]
X-ClientProxiedBy: YT1PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::20)
 To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (108.162.138.69) by
 YT1PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.30 via Frontend Transport; Thu, 13 May 2021 19:35:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d39e7021-d221-4382-d59b-08d916463374
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2505:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB250596F6F138810D5D80EA3F99519@DM5PR1201MB2505.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kz9CWClgntz2/fFpdRUif8YFuA4cSVP9H3p2LTCrmhWcyZe+Hekqqspo3pA8GiT+n6HtsL0H8MiiG93YuhGHYB7M0PGNsgO+nQ2hUWYgN+ctDwg8T/BipNTav5OawvWVa062SzG8EXT0TbAI1x8qS8czTVvmMIm80pknEBbcIWwQIOaLZCTMgZOzQlqoAxrrKnbcfV7mCwWPGqnAr8vInTKHi+5k7s/wTemC8Asqjaq6plQAGwHq60AjWcKKzZ2lut+HIDV+IAhiFVGca7CZlRDiz6zYHmv+3CBB56oxx2Q7R6vn1v49hkduQ/CgEPjhrQSCbFipsA39ELuaz4FIJraZOrfY/s0jTCpmNZFa4d2/MTklDHz75yFaffukx9cEYilI4U77Ta9+ZNTxIZWL75U0yXBMniK+qmDoed3CcY3LhL0Prqx6GFX28XhHQ7c5Xjkt/fyvvphJXFYUfOdpAfxZVZDpSCcTczoZlaO66kNIgT5bVev7YlEX1QKZSaXrxl7DlWQTHA3SQL7BmI4C1g5MjaO/xTuwLbZjgumSDT/cnkuXCK0GfDkBCWhIV8v6cjhknoQfAByn5R0XTPWXBK92R1Slf9/OlzWEOcba2CBjNmQ5RxaecMr2PT+WXUZ385JkBPKHr12cdD9TIsFLLNMlRO+FVIqeLiTDRbgUj5uPqqwWeU3/r+0CjGEZCPn8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(366004)(396003)(346002)(136003)(16526019)(2906002)(8936002)(26005)(316002)(54906003)(36756003)(86362001)(5660300002)(83380400001)(66946007)(66556008)(66476007)(30864003)(186003)(38100700002)(6486002)(4326008)(956004)(53546011)(31686004)(8676002)(44832011)(66574015)(2616005)(6506007)(478600001)(55236004)(31696002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bUNHcm9oaWYzYUxNQkF6ZlBLTHpmYWxidUpxdVpKZkZ2eElhUTlaSFl4dlZP?=
 =?utf-8?B?b1lWK0NVQmdTRnJkUEZYQTZCenlqeUxMaElodXlQVllvaDVKU2o3RXRzS1NY?=
 =?utf-8?B?YU1yZlZNc3FjSnNJRldYeFM3cis0cDhOUWMwRS9Oa1dWTy9ja0U1a3hHKzEy?=
 =?utf-8?B?RWpTNkJySndBSmdhYmk2Y0VrRCtKTFdhQnRaY29pcG81UWxmbUhWbTRxN0h0?=
 =?utf-8?B?R1hBV0ozcWhIRGt5RWw5RUZSQjdYc0RGei92YzE1dGEvOG9CMmtwcTZsS3Nt?=
 =?utf-8?B?Y3F4YVM2YkFRT2U5bWFuQW1SRGxWaFVmbFJMKzUvK2EzamlLZEtUMGMyWjVH?=
 =?utf-8?B?Q2xhY1JkVXhDeWY3d2lBNTlRTTY3YmFBYnIvRHVWaTNKcXQzaU9rMUlmVWha?=
 =?utf-8?B?Rk1taENLdkdXUkx4VVg0RDA3RFpCZXMzYkptYUhXemRnbnZzYlZFOHA5Mzln?=
 =?utf-8?B?S2pEY052cFBsTENDb1dzcTlkcmlVdzA5dUU2bFdDbEd1QUVNRGJndnhyZldL?=
 =?utf-8?B?cXR1ZlJNblJHNlBEaXJjREpzclpEQzRnek10K3lDSGZ3bjl1OE1XMExVL1hU?=
 =?utf-8?B?MjBFaCtBSUVtdWYwbWNtZmczVG9yUS90bEZYU0NCRlhIRS95QUFYdGVBTVQr?=
 =?utf-8?B?cGNESnh5VDV6WHlHTFJqalpFTXY0VjJSdHpDeERVTDRoclFNd0RoOXJibk9x?=
 =?utf-8?B?eVBkRGY1VGkrZGhkd0Q4QTBkZ2JDVFVXYm50c29rV2VQNFY2TGlKYnBPclRx?=
 =?utf-8?B?eHRMaEVScXBiZ2c5QVpsWmlsNC9RcGVZMDRUZjcwZEcrNTdNNnNQSVFldldZ?=
 =?utf-8?B?YkRmM08vbUl6WC9abjVWQ1poc3NIdS9lV0FnczFDaVplSHIrZWVrdnJNWlVL?=
 =?utf-8?B?ZTVHeHZpRm5IcUx4NGxNblBEeE5oejhPU2haaXhockMzWFkvTStIOG9BWGNm?=
 =?utf-8?B?WFFmSlBNKzY2QWsyMlFiQ3Fmakg1Qi8xUTI3dm1hTjhnMEdQRVM5YlMxejh0?=
 =?utf-8?B?ODRiMk9HUUE4YjNpM2pGYU1uWUpkOU5jMWdjbTNzYmpRSEwyRS9lTGdpdnJC?=
 =?utf-8?B?dTJaZzhiNHJGWCs1QlJYNTFvSVUwS3FmdmxBL211RE51eXdJNHNxZkdrY1Bj?=
 =?utf-8?B?SnltbTkvM3VVNnMyOWFtM3lTRDV1RGNJZWdmSU03LzJLNHdKc2xLSENpOVkw?=
 =?utf-8?B?dnNJQ1VGempETkFZOXVxT1dYby81bkViaVhBQ2tndEQ0aUs3VGpqMDRRcUpl?=
 =?utf-8?B?R3lDZGY1MGZhcUt4QUlURjlDNVdPeHhLb3lIN0NwWEs5TzZJaVNRQU90TmJM?=
 =?utf-8?B?eWh6SzZjNW83WGZSWExDczFUdXVCZWd6eFVUNGZoZ2VVVk1mMWxwQ0UyNStV?=
 =?utf-8?B?RTM4V3lVVFkrRi9aSVBVRldPcWNjN3NOcXdUNFhXSVkwdVpTZTNlL3VSWVNw?=
 =?utf-8?B?RFU5ZUMzc3RSRmF3b0JtelpINVIxeGN4WWRYMWRnWUFmTHVJbjNsb3BETndl?=
 =?utf-8?B?RmV3ZkZoVGlSMFNFWjQzT2NxQ05sNGpHalNRS3U1UVZHQVd5WGIybXVDY1Vm?=
 =?utf-8?B?QVpLSGwwOEJPaGVBZnV4NTVvbVR4VnhYQnZsUlBNVzJHbmNHbHZZR0VheG9p?=
 =?utf-8?B?dUhzY0xYZ2RxZmRUVkwxbk5BeW1RRDZYaEo1Y2MrTFMxWCtjQVRxbTBMeTRL?=
 =?utf-8?B?VTAvbHVCMFYwaVV2SUpPcGNFOVBTcVBqU2tUSllxOGY0bll4bzl0NU5ReG1l?=
 =?utf-8?Q?hywjG/paVWSE6VFM2byQsdBn6CLspgFxN0+V9hV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d39e7021-d221-4382-d59b-08d916463374
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 19:35:01.8331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wq2OSHG9udjgot5l/GCHeIlXGVFrVVgCdqYRWrncwPr7lxsWRmOMjvvGx7XycSNV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2505
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 John Clements <john.clements@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAyMS0wNS0xMyA0OjAwIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMTIu
MDUuMjEgdW0gMTk6MDMgc2NocmllYiBMdWJlbiBUdWlrb3Y6Cj4+IFdoZW4gdXNpbmcgVmVnYSAy
MCB3aXRoIFJBUyBzdXBwb3J0IGFuZCBSQVMgaXMKPj4gZW5hYmxlZCwgdGhlIHN5c3RlbSBpbnRl
cmFjdGl2aXR5IGlzIGV4dHJlbWVseQo+PiBzbG93LCB0byB0aGUgcG9pbnQgb2YgYmVpbmcgdW51
c2FibGUuIEFmdGVyCj4+IGRlYnVnZ2luZywgaXQgd2FzIGRldGVybWluZWQgdGhhdCB0aGlzIGlz
IGR1ZSB0bwo+PiB0aGUgcG9sbGluZyBsb29wIHBlcmZvcm1lZCBmb3IKPj4gQU1ER1BVX0NUWF9P
UF9RVUVSWV9TVEFURTIgdW5kZXIKPj4gYW1kZ3B1X2N0eF9pb2N0bCgpLCB3aGljaCBzZWVtcyB0
byBiZSBleGVjdXRlZCBvbgo+PiBldmVyeSBpb2N0bCBmcm9tIFgvTWVzYS4KPj4KPj4gVGhlIGxh
dHRlciBzZWVtcyB0byBjYWxsIGFtZGdwdV9jdHhfcXVlcnkyKCkgd2hpY2gKPj4gY2FsbHMgYW1k
Z3B1X3Jhc19xdWVyeV9lcnJvcl9jb3VudCgpIHR3aWNlLCBvbmNlCj4+IGZvciBlYWNoIG9mIHVl
X2NvdW50IGFuZCBjZV9jb3VudC4gVGhpcyBpcwo+PiB1bm5lY2Vzc2FyaWx5IHdhc3RlZnVsIHNp
bmNlCj4+IGFtZGdwdV9yYXNfcXVlcnlfZXJyb3JfY291bnQoKSBjYWxjdWxhdGVzIGJvdGgsCj4+
IGJ1dCB3aXRoIHRoZSBjdXJyZW50IGludGVyZmFjZSBpdCByZXR1cm5zIG9uZSBvcgo+PiB0aGUg
b3RoZXIsIGRlcGVuZGluZyBvbiBpdHMgQm9vbGVhbiBpbnB1dCwgd2hlbiBpdAo+PiBjYW4gaW4g
ZmFjdCByZXR1cm4gYm90aCwgaW4gYSBzaW5nbGUgaW52b2NhdGlvbiwKPj4gaWYgaXQgaGFkIGEg
YmV0dGVyIGludGVyZmFjZS4KPj4KPj4gRnVydGhlciBkb3duLCB0aGUgcXVlcnlfcmFzX2Vycm9y
X2NvdW50KCkgY2FsbGJhY2sKPj4gaXMgY2FsbGVkLCB3aGljaCBjb3VsZCBiZSBxdWl0ZSBhIGxh
cmdlIHBvbGxpbmcKPj4gbG9vcCwgYW5kIHZlcnkgdGltZSBjb25zdW1pbmcuIEZvciBpbnN0YW5j
ZSwKPj4gZ2Z4X3Y5XzBfcXVlcnlfcmFzX2Vycm9yX2NvdW50KCkgaXMgYXQgbGVhc3QKPj4gTyhu
XjMpLiBBIHNpbWlsYXIgc2l0dWF0aW9uIGlzIHNlZW4gd2l0aAo+PiB1bWNfdjZfMV9xdWVyeV9y
YXNfZXJyb3JfY291bnQoKS4KPj4KPj4gVGhpcyBjb21taXQgaW1wbGVtZW50cyBhc3luY2hyb25v
dXMgUkFTIGVycm9yCj4+IGNvdW50IHBvbGxpbmcgdG8gdGhhdCBvZiB0aGUgaW9jdGwuIEEga2Vy
bmVsCj4+IHRocmVhZCBwb2xscyB0aGUgUkFTIGVycm9yIGNvdW50ZXJzIG9uY2UgaW4gYQo+PiB3
aGlsZS4gVGhlIGlvY3RsIHJlYWRzIHRoZSB2YWx1ZXMKPj4gYXN5bmNocm9ub3VzbHkuIFRoZSBw
b2xsIGZyZXF1ZW5jeSBpcyBhIG1vZHVsZQo+PiBwYXJhbWV0ZXIsIHdpdGggcmFuZ2UgWzUwMCwg
MTAwMDBdIG1pbGxpc2Vjb25kcywKPj4gZGVmYXVsdCAzMDAwLgo+Pgo+PiB2MjogRW5hYmxlIHNl
dHRpbmcgdGhlIHBvbGxpbmcgaW50ZXJ2YWwgdG8gMCwKPj4gICAgICB3aGljaCBkaXNhYmxlcyB0
aGUgdGhyZWFkLgo+IFBsZWFzZSBkcm9wIHRoZSBtb2R1bGUgcGFyYW1ldGVyLCB3ZSBhbHJlYWR5
IGhhdmUgd2F5IHRvIG1hbnkgbW9kdWxlIAo+IHBhcmFtZXRlcnMgYW5kIHRoYXQgZG9lc24ndCBh
ZGQgbXVjaCB2YWx1ZS4KCk5vIHByb2JsZW0uCgpTbyB0aHJlZSBzZWNvbmRzIHRoZW4/Cgo+Cj4g
VGhlbiBJIHdvdWxkIHJlYWxseSBwcmVmZXIgdG8gaW1wbGVtZW50IHRoaXMgYXMgYSBkZWxheWVk
IHdvcmsgaXRlbSBpbnN0ZWFkLgo+Cj4gSWYgeW91IGNhbGwgc2NoZWR1bGVfZGVsYXllZF93b3Jr
KCkgZnJvbSB0aGUgYW1kZ3B1X2N0eF9xdWVyeTIoKSB0aGUgCj4gd29yayBpdGVtIHdpbGwgb25s
eSBiZSBzdGFydGVkIGV2ZXJ5IFggamlmZmllcyB3aGVuIHRoZSBmdW5jdGlvbiBpcyAKPiBhY3R1
YWxseSB1c2VkLgoKWWVzLCB5b3UgbWVudGlvbmVkIHRoaXMgaW4gb3VyIG1lZXRpbmcgYW5kIEkg
ZGlkIHJlcGx5IHRvIHRoaXMgdGhlbjoKCkknZCByYXRoZXIga2VlcCBpdCBhIHRocmVhZCwgYmVj
YXVzZSBpdCBzaG93cyBpbnRlbnRpb24sIGl0IHNob3dzIHRoYXQKd2UndmUgY29tbWl0dGVkIHRo
YXQgdGhpcyBpcyB3b3JrIHdoaWNoIHdlIG5lZWQgZG9uZSwgcGVyaW9kaWNhbGx5CmFuZCB0aGF0
IGl0IGlzIHNvbWV0aGluZyB3ZSB3YW50IHRvIGRvLS11c2luZyBhIHRocmVhZCBtYWtlcyBpdAp2
aXNpYmxlLCBrbm93biwgaW50ZW50aW9uYWwuCgpJIGRvbid0IG1pbmQgdXNpbmcgImRlbGF5ZWQg
d29yayIsIGZvciAid29yayIgaXRlbXMgd2hpY2ggYXJlIG9uZS1vZmYsCm9yIHNvbWV0aGluZyBp
bnRlcm1pdHRlbnQsIG5vbi1yZWd1bGFyIHR5cGUgb2Ygd29yaywgbm9uLXBlcmlvZGljIHR5cGUg
b2Ygd29yay4KClJlZ2FyZHMsCkx1YmVuCgo+Cj4gUmVnYXJkcywKPiBDaHJpc3RpYW4uCj4KPj4g
Q2M6IEFsZXhhbmRlciBEZXVjaGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPgo+PiBDYzog
Sm9obiBDbGVtZW50cyA8am9obi5jbGVtZW50c0BhbWQuY29tPgo+PiBDYzogSGF3a2luZyBaaGFu
ZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3Yg
PGx1YmVuLnR1aWtvdkBhbWQuY29tPgo+PiBSZXZpZXdlZC1ieTogSm9obiBDbGVtZW50cyA8am9o
bi5jbGVtZW50c0BhbWQuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaCAgICAgfCAgMSArCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2N0eC5jIHwgMzYgKysrKysrKy0tLS0tLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZHJ2LmMgfCAxMCArKysrCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5jIHwgNjYgKysrKysrKysrKysrKysrKysrKysrKy0tLQo+PiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCB8ICA4ICstLQo+PiAgIDUgZmlsZXMg
Y2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4+IGluZGV4IDMxNDdjMWM5MzVjOC4uYTI2OWY3NzgxOTRm
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+PiBAQCAtMTk3LDYgKzE5
Nyw3IEBAIGV4dGVybiBzdHJ1Y3QgYW1kZ3B1X21ncHVfaW5mbyBtZ3B1X2luZm87Cj4+ICAgZXh0
ZXJuIGludCBhbWRncHVfcmFzX2VuYWJsZTsKPj4gICBleHRlcm4gdWludCBhbWRncHVfcmFzX21h
c2s7Cj4+ICAgZXh0ZXJuIGludCBhbWRncHVfYmFkX3BhZ2VfdGhyZXNob2xkOwo+PiArZXh0ZXJu
IHVpbnQgYW1kZ3B1X3Jhc190aHJlYWRfcG9sbF9tczsKPj4gICBleHRlcm4gc3RydWN0IGFtZGdw
dV93YXRjaGRvZ190aW1lciBhbWRncHVfd2F0Y2hkb2dfdGltZXI7Cj4+ICAgZXh0ZXJuIGludCBh
bWRncHVfYXN5bmNfZ2Z4X3Jpbmc7Cj4+ICAgZXh0ZXJuIGludCBhbWRncHVfbWNicDsKPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYwo+PiBpbmRleCBkNDgxYTMzZjRlYWYu
LjU1OGU4ODdlOTliNiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2N0eC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9j
dHguYwo+PiBAQCAtMzMyLDEyICszMzIsMTIgQEAgc3RhdGljIGludCBhbWRncHVfY3R4X3F1ZXJ5
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+PiAgIH0KPj4gICAKPj4gICBzdGF0aWMgaW50
IGFtZGdwdV9jdHhfcXVlcnkyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+PiAtCXN0cnVj
dCBhbWRncHVfZnByaXYgKmZwcml2LCB1aW50MzJfdCBpZCwKPj4gLQl1bmlvbiBkcm1fYW1kZ3B1
X2N0eF9vdXQgKm91dCkKPj4gKwkJCSAgICAgc3RydWN0IGFtZGdwdV9mcHJpdiAqZnByaXYsIHVp
bnQzMl90IGlkLAo+PiArCQkJICAgICB1bmlvbiBkcm1fYW1kZ3B1X2N0eF9vdXQgKm91dCkKPj4g
ICB7Cj4+ICsJc3RydWN0IGFtZGdwdV9yYXMgKmNvbiA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQo
YWRldik7Cj4+ICAgCXN0cnVjdCBhbWRncHVfY3R4ICpjdHg7Cj4+ICAgCXN0cnVjdCBhbWRncHVf
Y3R4X21nciAqbWdyOwo+PiAtCXVuc2lnbmVkIGxvbmcgcmFzX2NvdW50ZXI7Cj4+ICAgCj4+ICAg
CWlmICghZnByaXYpCj4+ICAgCQlyZXR1cm4gLUVJTlZBTDsKPj4gQEAgLTM2MiwyMCArMzYyLDIy
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2N0eF9xdWVyeTIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCj4+ICAgCWlmIChhdG9taWNfcmVhZCgmY3R4LT5ndWlsdHkpKQo+PiAgIAkJb3V0LT5zdGF0
ZS5mbGFncyB8PSBBTURHUFVfQ1RYX1FVRVJZMl9GTEFHU19HVUlMVFk7Cj4+ICAgCj4+IC0JLypx
dWVyeSB1ZSBjb3VudCovCj4+IC0JLyogcmFzX2NvdW50ZXIgPSBhbWRncHVfcmFzX3F1ZXJ5X2Vy
cm9yX2NvdW50KGFkZXYsIGZhbHNlKTsgKi8KPj4gLQkvKiAvXCpyYXMgY291bnRlciBpcyBtb25v
dG9uaWMgaW5jcmVhc2luZypcLyAqLwo+PiAtCS8qIGlmIChyYXNfY291bnRlciAhPSBjdHgtPnJh
c19jb3VudGVyX3VlKSB7ICovCj4+IC0JLyogCW91dC0+c3RhdGUuZmxhZ3MgfD0gQU1ER1BVX0NU
WF9RVUVSWTJfRkxBR1NfUkFTX1VFOyAqLwo+PiAtCS8qIAljdHgtPnJhc19jb3VudGVyX3VlID0g
cmFzX2NvdW50ZXI7ICovCj4+IC0JLyogfSAqLwo+PiAtCj4+IC0JLyogL1wqcXVlcnkgY2UgY291
bnQqXC8gKi8KPj4gLQkvKiByYXNfY291bnRlciA9IGFtZGdwdV9yYXNfcXVlcnlfZXJyb3JfY291
bnQoYWRldiwgdHJ1ZSk7ICovCj4+IC0JLyogaWYgKHJhc19jb3VudGVyICE9IGN0eC0+cmFzX2Nv
dW50ZXJfY2UpIHsgKi8KPj4gLQkvKiAJb3V0LT5zdGF0ZS5mbGFncyB8PSBBTURHUFVfQ1RYX1FV
RVJZMl9GTEFHU19SQVNfQ0U7ICovCj4+IC0JLyogCWN0eC0+cmFzX2NvdW50ZXJfY2UgPSByYXNf
Y291bnRlcjsgKi8KPj4gLQkvKiB9ICovCj4+ICsJaWYgKGNvbikgewo+PiArCQlpbnQgY2VfY291
bnQsIHVlX2NvdW50Owo+PiArCj4+ICsJCWNlX2NvdW50ID0gYXRvbWljX3JlYWQoJmNvbi0+cmFz
X2NlX2NvdW50KTsKPj4gKwkJdWVfY291bnQgPSBhdG9taWNfcmVhZCgmY29uLT5yYXNfdWVfY291
bnQpOwo+PiArCj4+ICsJCWlmIChjZV9jb3VudCAhPSBjdHgtPnJhc19jb3VudGVyX2NlKSB7Cj4+
ICsJCQlvdXQtPnN0YXRlLmZsYWdzIHw9IEFNREdQVV9DVFhfUVVFUlkyX0ZMQUdTX1JBU19DRTsK
Pj4gKwkJCWN0eC0+cmFzX2NvdW50ZXJfY2UgPSBjZV9jb3VudDsKPj4gKwkJfQo+PiArCj4+ICsJ
CWlmICh1ZV9jb3VudCAhPSBjdHgtPnJhc19jb3VudGVyX3VlKSB7Cj4+ICsJCQlvdXQtPnN0YXRl
LmZsYWdzIHw9IEFNREdQVV9DVFhfUVVFUlkyX0ZMQUdTX1JBU19VRTsKPj4gKwkJCWN0eC0+cmFz
X2NvdW50ZXJfdWUgPSB1ZV9jb3VudDsKPj4gKwkJfQo+PiArCX0KPj4gICAKPj4gICAJbXV0ZXhf
dW5sb2NrKCZtZ3ItPmxvY2spOwo+PiAgIAlyZXR1cm4gMDsKPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kcnYuYwo+PiBpbmRleCA4Nzc0NjlkMjg4ZjguLjY0MWMzNzRiODUyNSAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+PiBAQCAtMTgz
LDYgKzE4Myw3IEBAIHN0cnVjdCBhbWRncHVfbWdwdV9pbmZvIG1ncHVfaW5mbyA9IHsKPj4gICBp
bnQgYW1kZ3B1X3Jhc19lbmFibGUgPSAtMTsKPj4gICB1aW50IGFtZGdwdV9yYXNfbWFzayA9IDB4
ZmZmZmZmZmY7Cj4+ICAgaW50IGFtZGdwdV9iYWRfcGFnZV90aHJlc2hvbGQgPSAtMTsKPj4gK3Vp
bnQgYW1kZ3B1X3Jhc190aHJlYWRfcG9sbF9tcyA9IDMwMDA7Cj4+ICAgc3RydWN0IGFtZGdwdV93
YXRjaGRvZ190aW1lciBhbWRncHVfd2F0Y2hkb2dfdGltZXIgPSB7Cj4+ICAgCS50aW1lb3V0X2Zh
dGFsX2Rpc2FibGUgPSBmYWxzZSwKPj4gICAJLnBlcmlvZCA9IDB4MCwgLyogZGVmYXVsdCB0byAw
eDAgKHRpbWVvdXQgZGlzYWJsZSkgKi8KPj4gQEAgLTUzNCw2ICs1MzUsMTUgQEAgbW9kdWxlX3Bh
cmFtX25hbWVkKGVtdV9tb2RlLCBhbWRncHVfZW11X21vZGUsIGludCwgMDQ0NCk7Cj4+ICAgTU9E
VUxFX1BBUk1fREVTQyhyYXNfZW5hYmxlLCAiRW5hYmxlIFJBUyBmZWF0dXJlcyBvbiB0aGUgR1BV
ICgwID0gZGlzYWJsZSwgMSA9IGVuYWJsZSwgLTEgPSBhdXRvIChkZWZhdWx0KSkiKTsKPj4gICBt
b2R1bGVfcGFyYW1fbmFtZWQocmFzX2VuYWJsZSwgYW1kZ3B1X3Jhc19lbmFibGUsIGludCwgMDQ0
NCk7Cj4+ICAgCj4+ICsvKioKPj4gKyAqIERPQzogcmFzX3RocmVhZF9wb2xsICh1aW50KQo+PiAr
ICogTnVtYmVyIG9mIG1pbGxpc2Vjb25kcyBiZXR3ZWVuIFJBUyBwb2xsIGZvciBlcnJvcnMuCj4+
ICsgKiBWYWxpZCByYW5nZSAwIGFuZCBbNTAwLDEwMDAwXS4gU2V0IHRvIDAgdG8gZGlzYWJsZSB0
aGUgdGhyZWFkLgo+PiArICogRGVmYXVsdDogMzAwMC4KPj4gKyAqLwo+PiArTU9EVUxFX1BBUk1f
REVTQyhyYXNfdGhyZWFkX3BvbGwsICJOdW1iZXIgb2YgbWlsbGlzZWNvbmRzIGJldHdlZW4gUkFT
IHBvbGwgZm9yIGVycm9ycy4gVmFsaWQgcmFuZ2UgMCBhbmQgWzUwMCwxMDAwMF0uIFNldCB0byAw
IHRvIGRpc2FibGUgdGhlIHRocmVhZC4gRGVmYXVsdDogMzAwMC4iKTsKPj4gK21vZHVsZV9wYXJh
bV9uYW1lZChyYXNfdGhyZWFkX3BvbGwsIGFtZGdwdV9yYXNfdGhyZWFkX3BvbGxfbXMsIHVpbnQs
IDA0NDQpOwo+PiArCj4+ICAgLyoqCj4+ICAgICogRE9DOiByYXNfbWFzayAodWludCkKPj4gICAg
KiBNYXNrIG9mIFJBUyBmZWF0dXJlcyB0byBlbmFibGUgKGRlZmF1bHQgMHhmZmZmZmZmZiksIG9u
bHkgdmFsaWQgd2hlbiByYXNfZW5hYmxlID09IDEKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yYXMuYwo+PiBpbmRleCBiMWM1N2E1YjZlODkuLjMwYmVjMjg5ZTlhZCAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+PiBAQCAtMTA0MywxNSAr
MTA0MywxNyBAQCBpbnQgYW1kZ3B1X3Jhc19lcnJvcl9pbmplY3Qoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCj4+ICAgfQo+PiAgIAo+PiAgIC8qIGdldCB0aGUgdG90YWwgZXJyb3IgY291bnRz
IG9uIGFsbCBJUHMgKi8KPj4gLXVuc2lnbmVkIGxvbmcgYW1kZ3B1X3Jhc19xdWVyeV9lcnJvcl9j
b3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPj4gLQkJYm9vbCBpc19jZSkKPj4gK3N0
YXRpYyB2b2lkIGFtZGdwdV9yYXNfcXVlcnlfZXJyb3JfY291bnQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCj4+ICAgewo+PiAgIAlzdHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0gYW1kZ3B1X3Jh
c19nZXRfY29udGV4dChhZGV2KTsKPj4gICAJc3RydWN0IHJhc19tYW5hZ2VyICpvYmo7Cj4+IC0J
c3RydWN0IHJhc19lcnJfZGF0YSBkYXRhID0gezAsIDB9Owo+PiArCWludCBjZV9jb3VudCwgdWVf
Y291bnQ7Cj4+ICAgCj4+ICAgCWlmICghYWRldi0+cmFzX2VuYWJsZWQgfHwgIWNvbikKPj4gLQkJ
cmV0dXJuIDA7Cj4+ICsJCXJldHVybjsKPj4gKwo+PiArCWNlX2NvdW50ID0gMDsKPj4gKwl1ZV9j
b3VudCA9IDA7Cj4+ICAgCj4+ICAgCWxpc3RfZm9yX2VhY2hfZW50cnkob2JqLCAmY29uLT5oZWFk
LCBub2RlKSB7Cj4+ICAgCQlzdHJ1Y3QgcmFzX3F1ZXJ5X2lmIGluZm8gPSB7Cj4+IEBAIC0xMDU5
LDEzICsxMDYxLDE0IEBAIHVuc2lnbmVkIGxvbmcgYW1kZ3B1X3Jhc19xdWVyeV9lcnJvcl9jb3Vu
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPj4gICAJCX07Cj4+ICAgCj4+ICAgCQlpZiAo
YW1kZ3B1X3Jhc19xdWVyeV9lcnJvcl9zdGF0dXMoYWRldiwgJmluZm8pKQo+PiAtCQkJcmV0dXJu
IDA7Cj4+ICsJCQlyZXR1cm47Cj4+ICAgCj4+IC0JCWRhdGEuY2VfY291bnQgKz0gaW5mby5jZV9j
b3VudDsKPj4gLQkJZGF0YS51ZV9jb3VudCArPSBpbmZvLnVlX2NvdW50Owo+PiArCQljZV9jb3Vu
dCArPSBpbmZvLmNlX2NvdW50Owo+PiArCQl1ZV9jb3VudCArPSBpbmZvLnVlX2NvdW50Owo+PiAg
IAl9Cj4+ICAgCj4+IC0JcmV0dXJuIGlzX2NlID8gZGF0YS5jZV9jb3VudCA6IGRhdGEudWVfY291
bnQ7Cj4+ICsJYXRvbWljX3NldCgmY29uLT5yYXNfY2VfY291bnQsIGNlX2NvdW50KTsKPj4gKwlh
dG9taWNfc2V0KCZjb24tPnJhc191ZV9jb3VudCwgdWVfY291bnQpOwo+PiAgIH0KPj4gICAvKiBx
dWVyeS9pbmplY3QvY3VyZSBlbmQgKi8KPj4gICAKPj4gQEAgLTIxMDksNiArMjExMiw0OSBAQCBz
dGF0aWMgdm9pZCBhbWRncHVfcmFzX2NoZWNrX3N1cHBvcnRlZChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKPj4gICAJCWFkZXYtPnJhc19od19lbmFibGVkICYgYW1kZ3B1X3Jhc19tYXNrOwo+
PiAgIH0KPj4gICAKPj4gK3N0YXRpYyBpbnQgYW1kZ3B1X3Jhc190aHJlYWQodm9pZCAqZGF0YSkK
Pj4gK3sKPj4gKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGRhdGE7Cj4+ICsJc3RydWN0
IGFtZGdwdV9yYXMgICAgKmNvbiAgPSBhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYpOwo+PiAr
Cj4+ICsJY29uLT5yYXNfdGhyZWFkX3BvbGxfbXMgPSBhbWRncHVfcmFzX3RocmVhZF9wb2xsX21z
Owo+PiArCWlmIChjb24tPnJhc190aHJlYWRfcG9sbF9tcyA9PSAwKSB7Cj4+ICsJCWF0b21pY19z
ZXQoJmNvbi0+cmFzX2NlX2NvdW50LCAwKTsKPj4gKwkJYXRvbWljX3NldCgmY29uLT5yYXNfdWVf
Y291bnQsIDApOwo+PiArCQlyZXR1cm4gMDsKPj4gKwl9IGVsc2UgaWYgKGNvbi0+cmFzX3RocmVh
ZF9wb2xsX21zIDwgNTAwIHx8Cj4+ICsJCSAgIGNvbi0+cmFzX3RocmVhZF9wb2xsX21zID4gMTAw
MDApIHsKPj4gKwkJY29uLT5yYXNfdGhyZWFkX3BvbGxfbXMgPSAzMDAwOwo+PiArCX0KPj4gKwo+
PiArCXdoaWxlICgxKSB7Cj4+ICsJCWlmIChrdGhyZWFkX3Nob3VsZF9zdG9wKCkpCj4+ICsJCQli
cmVhazsKPj4gKwkJaWYgKGt0aHJlYWRfc2hvdWxkX3BhcmsoKSkKPj4gKwkJCWt0aHJlYWRfcGFy
a21lKCk7Cj4+ICsKPj4gKwkJYW1kZ3B1X3Jhc19xdWVyeV9lcnJvcl9jb3VudChhZGV2KTsKPj4g
KwkJbXNsZWVwX2ludGVycnVwdGlibGUoY29uLT5yYXNfdGhyZWFkX3BvbGxfbXMpOwo+PiArCX0K
Pj4gKwo+PiArCXJldHVybiAwOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IGFtZGdwdV9yYXNf
dGhyZWFkX3N0YXJ0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+PiArewo+PiArCXN0cnVj
dCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYpOwo+PiArCXN0
cnVjdCB0YXNrX3N0cnVjdCAqa3Q7Cj4+ICsKPj4gKwlrdCA9IGt0aHJlYWRfcnVuKGFtZGdwdV9y
YXNfdGhyZWFkLCBhZGV2LAo+PiArCQkJICJhbWRyYXM6JXMiLCBwY2lfbmFtZShhZGV2LT5wZGV2
KSk7Cj4+ICsJaWYgKElTX0VSUihrdCkpCj4+ICsJCXJldHVybiBQVFJfRVJSKGt0KTsKPj4gKwo+
PiArCWNvbi0+cmFzX3RocmVhZCA9IGt0Owo+PiArCj4+ICsJcmV0dXJuIDA7Cj4+ICt9Cj4+ICsK
Pj4gICBpbnQgYW1kZ3B1X3Jhc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+PiAg
IHsKPj4gICAJc3RydWN0IGFtZGdwdV9yYXMgKmNvbiA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQo
YWRldik7Cj4+IEBAIC0yMTgyLDYgKzIyMjgsMTAgQEAgaW50IGFtZGdwdV9yYXNfaW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPj4gICAJCWdvdG8gcmVsZWFzZV9jb247Cj4+ICAgCX0K
Pj4gICAKPj4gKwlyID0gYW1kZ3B1X3Jhc190aHJlYWRfc3RhcnQoYWRldik7Cj4+ICsJaWYgKHIp
Cj4+ICsJCWdvdG8gcmVsZWFzZV9jb247Cj4+ICsKPj4gICAJZGV2X2luZm8oYWRldi0+ZGV2LCAi
UkFTIElORk86IHJhcyBpbml0aWFsaXplZCBzdWNjZXNzZnVsbHksICIKPj4gICAJCSAiaGFyZHdh
cmUgYWJpbGl0eVsleF0gcmFzX21hc2tbJXhdXG4iLAo+PiAgIAkJIGFkZXYtPnJhc19od19lbmFi
bGVkLCBhZGV2LT5yYXNfZW5hYmxlZCk7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmgKPj4gaW5kZXggMjAxZmJkZWUxZDA5Li5mYjllNGM3YWIwNTQgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgKPj4gQEAgLTM0MCw2ICszNDAsMTEg
QEAgc3RydWN0IGFtZGdwdV9yYXMgewo+PiAgIAo+PiAgIAkvKiBkaXNhYmxlIHJhcyBlcnJvciBj
b3VudCBoYXJ2ZXN0IGluIHJlY292ZXJ5ICovCj4+ICAgCWJvb2wgZGlzYWJsZV9yYXNfZXJyX2Nu
dF9oYXJ2ZXN0Owo+PiArCj4+ICsJc3RydWN0IHRhc2tfc3RydWN0ICpyYXNfdGhyZWFkOwo+PiAr
CXVuc2lnbmVkIGludCAgICAgICAgcmFzX3RocmVhZF9wb2xsX21zOwo+PiArCWF0b21pY190ICAg
ICAgICAgICAgcmFzX3VlX2NvdW50Owo+PiArCWF0b21pY190ICAgICAgICAgICAgcmFzX2NlX2Nv
dW50Owo+PiAgIH07Cj4+ICAgCj4+ICAgc3RydWN0IHJhc19mc19kYXRhIHsKPj4gQEAgLTQ4NSw5
ICs0OTAsNiBAQCBpbnQgYW1kZ3B1X3Jhc19yZXF1ZXN0X3Jlc2V0X29uX2Jvb3Qoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCj4+ICAgdm9pZCBhbWRncHVfcmFzX3Jlc3VtZShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldik7Cj4+ICAgdm9pZCBhbWRncHVfcmFzX3N1c3BlbmQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpOwo+PiAgIAo+PiAtdW5zaWduZWQgbG9uZyBhbWRncHVfcmFzX3F1
ZXJ5X2Vycm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+PiAtCQlib29sIGlz
X2NlKTsKPj4gLQo+PiAgIC8qIGVycm9yIGhhbmRsaW5nIGZ1bmN0aW9ucyAqLwo+PiAgIGludCBh
bWRncHVfcmFzX2FkZF9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+ICAg
CQlzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqYnBzLCBpbnQgcGFnZXMpOwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
