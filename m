Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8E537359D
	for <lists+amd-gfx@lfdr.de>; Wed,  5 May 2021 09:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE686E438;
	Wed,  5 May 2021 07:30:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22B46E42D
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 May 2021 07:30:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzeDbFYZcWZtpUJAue+Z5NjVV/DHxm0vo/8AbqqXyFdbIzjHdoOGKnXVmCxRQa0sRhdBXUZlRm5uy8rbyXGxm5D29TxbD1ZsWHyFRmgm2bZ18kznsY90jqlCBJXaZf1QyJ5amYRMIFvmX9k2JuCdtloNmabsQdaU99J58z89/y/KY/nRkn+tRfQc+leNzp4icEALEsskKA/Cwg+KMxqJ+E6IaW5G2GkFjaEL1gTkbjQOk5k2Wh9VI/zw+3DfMYRno5bwVWkk7n+NUEcaQumGmV++PVI3dAvAtaDAZ4J707lVayXvGR2YG3+sHtOuM3UAlbGet/b2jk+/L3xhcHskwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKFO5E4aQYXrt3j8Du0cOCxmKO3A3SWPwCqxVHJ76F0=;
 b=TPcOfyPYGWUiTwotkKjyTPeS0lmwKp6dYwGto+mGR+Zu5nTBZpJx+zQ49TCeO1CwRWuXosb5GnOk3+4HfPnjNe/PtbgSbUa1fvIxEljiCmRACJ8mRacbtJJWUayoR1kibY9a4ETSeF9IpVhxetQ07ctSwRrKJDQMC0vxqmy443HVOzczawhUIl2H08OOpY3QnLig91OBNCeR8uoHTGB3YTuSS33fiO8U3f6eWv+lM6wINXqJFNtxWuP+5KOEcRgJIJRG3EQve/YQ061cQXbxSoTtzQ9MgGWsU9pivG0swmYvA+JWcU4I+SLTOFvmdof5yX1E+Z7tONLxA+2Ib2rSGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKFO5E4aQYXrt3j8Du0cOCxmKO3A3SWPwCqxVHJ76F0=;
 b=b5EfD7vm8Et4/Nl+eReE26U0wTI1EtG+EwFg3mEgw5Je+SUVgLJT7x9oPBq3srytDOO70EtWRg9AQcOeE2lnS6Ik+ubd4+VdmEIoKPGvepoxbRHmPRsoubwFA/d+s40gjgC1uCA9IRIwffECyNZBP/7JFBhnm0bNSXJgtVtw0D0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR12MB1866.namprd12.prod.outlook.com (2603:10b6:3:10c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 07:30:20 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::142:82e3:7e9d:55a0]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::142:82e3:7e9d:55a0%6]) with mapi id 15.20.4108.025; Wed, 5 May 2021
 07:30:20 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/amdgpu: Remove redundant ras->supported
Date: Wed,  5 May 2021 03:30:02 -0400
Message-Id: <20210505073005.5128-2-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.31.0.97.g1424303384
In-Reply-To: <20210505073005.5128-1-luben.tuikov@amd.com>
References: <20210505073005.5128-1-luben.tuikov@amd.com>
X-Originating-IP: [108.162.138.69]
X-ClientProxiedBy: YT1PR01CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::10) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (108.162.138.69) by
 YT1PR01CA0041.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.40 via Frontend Transport; Wed, 5 May 2021 07:30:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcb0bda3-c997-4cef-38ed-08d90f97a316
X-MS-TrafficTypeDiagnostic: DM5PR12MB1866:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1866F814F7832733B3E73D0299599@DM5PR12MB1866.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tPOBSqXkZZzpX8xmd0Cv0j12OzIbTAEkFKXLSWVHGMORqCNd0eBSAMFb82wxejiVpeLKhU4/LvW+jtbf7EPipGUTCA9NH2EJXMBwmO7wpCP1WgfA6BOOiorpBz6jNSsxWPK1s2AQjMIm4o+x1xe2ydXZHBynEmJgx1QioKc+lYfWMQ6SQ1uIqLPr8DGCcDd253wElXMeZ424PFe8CknWlH/bxTr1d+ul9AXB2/cFdWtcRz86n8nDps6NizEy0adyG6dZQ1AkR/WIGmC6auztk77Fa88uTJ8CSmXqIFmXY7+S5zBnW/n5DL5xu8BR88S/I0AKcAUye3Cr7cjkDYoH8lW3/S/HqoKeQj+ViSNm5Mm8XWOr+4rsuw7EBd2oOOvmlrXyzM4Tj4AL1o1e9sJDB44Hf5+cTubsmFZMFXJ8mNeA8h8CZ95YAty7kAFF18INov1+Jruj23tYIiPyl4QkpsD7kSLCgRQWljRiJjYbU0/2tTZewMwCjkOstu606g1C88gN3mFwfIORyiXA3Wqef3ZO+d7mu/+cy2ywir6bCYgxjELivbHg4WjQLbsHWzm/M21XLN0gzDbtnk+nrZj1CLKyBF+LdhjJ0+8lY0E41fvbRRVkW5UQdnrPdFn02aZ23scx4vkQ5kLgc6OHN7S54g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(36756003)(4326008)(956004)(8676002)(44832011)(26005)(2906002)(54906003)(1076003)(6666004)(2616005)(316002)(5660300002)(8936002)(6916009)(52116002)(6506007)(6512007)(83380400001)(66476007)(66556008)(38350700002)(186003)(16526019)(6486002)(38100700002)(66574015)(86362001)(66946007)(478600001)(55236004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b2U0eUovNzJuRi96OHNLMW16alRaKzMvTHdQYjNGQnc4M0c1QWx3UVM5VGJ5?=
 =?utf-8?B?OFpTdjBCRnlzTlFnZVl6V0prOTd6WWRWWUJJeWxsdzFKZnpDckNHSDJ5WDQv?=
 =?utf-8?B?RSttMGJ5cnRTZGRhSk9OS1QzMXpqMWIrUmVCT1NKODh3cWFRTldBWDA1U2FK?=
 =?utf-8?B?N1Rac1A5eEpNK3ZOSVhwLzdlRnNjSytvOWZEd09vVjNwbUNWbWYySENvL2ZM?=
 =?utf-8?B?WkpxY2g3SU9EYkVxRGtpdnQ5WDBBK3liKzdBVzQxbW5FY3V2STQvZ2dPN3I2?=
 =?utf-8?B?OTlvTFVvV01PSlMrbU40Wk0zYU1WUjEwc2Rpcml4WklxRXdCNzNMaXgyd2pL?=
 =?utf-8?B?S0VFU2ZWWjFlV3Z5SHA1U051VnZ6TmxrNTNGc0hZNFFiNlNtQ3dOTi9TamJW?=
 =?utf-8?B?MDY0TmZhOEdBWlFFdTJjVlptLzJaVjVCY2l5UGxrZkhjblYxV0Z3VmtEMXJH?=
 =?utf-8?B?dU5jemFISzUydEhUbWJPcWJ0Umw2WkRReXl1RUVOT3o2TDVUTFJzemkvUkNs?=
 =?utf-8?B?NFVIVlUxcnNwU24xbVROTnBkZXgvOVR0N2NYZTJJYXkvZXd4Z2RDeWtDTDE2?=
 =?utf-8?B?RGVoMmNENWsxZ3VISTduc3hKVHFOT1Z6d3JXQWduUlkvbmJjQXpPNjJZM1dL?=
 =?utf-8?B?dUFjcTBtVVM2eHlHVGxWSWRVU2VkSXBYc0xITWh5RmVQbHNRcW9ZN1A3VDh4?=
 =?utf-8?B?UE9uNE55TVpjQmlsSy9oa2hMVFZYdlFRMHROQ0VGUEowaUNHM3RaSUg1NFQw?=
 =?utf-8?B?MVgxSTRnZ2JYSnBTRmNoMUszWU1UKzc5RVZmRnFKTUNYdlNxUE9URDYzRS9L?=
 =?utf-8?B?WmpHR053ZlpMUGVrZXN3TElZVm55c2UzWUFEYU9FQWVSZnRCLys2RWpWY1VN?=
 =?utf-8?B?VklTTmZYTkV6b2JWSGE4M1J3L3BPem1qT0JtSUVZNklLL0RtVit4eUVFUlVy?=
 =?utf-8?B?QnlwSlNSdnhTc2dDMGIvWXBTb2c4Z0gxL3AwOGZldWw5VVZlQzk4bEFPWVpy?=
 =?utf-8?B?blVidkUxUmxZamduZVlNOEM2S0ZLbUJQaDZLK3ZLbXNQY0x0bThjL1hEbHla?=
 =?utf-8?B?UEVGY3lxckZDcmdTOFpxSmhnZ01BRFIwQ1BiTWlVRm8xWllsQ2ttVHdhSzRW?=
 =?utf-8?B?Q0lDMXl2Y0RLRlNHQlg0bGU4MzFoUUZtYTgyRnJhTDUreHpIaFhJYVRkT01v?=
 =?utf-8?B?K1ZVb1Yrb3VRQklJa2UxdVFtK0phazU5Z0hHcVI0MkVjbVZ3Y1lLWk1XNHZL?=
 =?utf-8?B?MTZPbUJmM0drN2xMemZ5OU50Mm9ybk4rd3NvQXVRWXNLaitnVlVORldWbDgy?=
 =?utf-8?B?a0NoU1NOWitqTkNpTFMraVYxMFZsYkJmRlp3d09mU2JCOFA5MzRZdllGcFNY?=
 =?utf-8?B?S2ljUmdWTDlocVdrekFnTGhXazdzQnR1OWZMa045c3VqcGh2djBjVEFEbTRn?=
 =?utf-8?B?WExaMkJVZ3NEVWhYM0E4Z0luMGdNMHNDZWgyNEs0RjJhR2lvWVh5di9oTG1D?=
 =?utf-8?B?VnBBd1M5QVlXZEQ1ck1lTlZNVFJoZ29VMlovdUtaRTNQbUZGQTFVUTIzdFdo?=
 =?utf-8?B?aFhSbElHWFNodlBZK3JNTUd0OHBVczhLSjlLb1VsbkxBWWRRcHZGNEpUZmUw?=
 =?utf-8?B?YlFrbjkvM2xKcVJ2YnNpcjNrVkRqOStNUDc5Z0VGTURRZ0hzQWJvc1grNktO?=
 =?utf-8?B?cTBCSnJKL3IrbitzS2F4dHdDL1VjbHNQUzZCWEZYcnQxcWxjNTdseXZMRlBh?=
 =?utf-8?Q?7/KYsiV4DrsYRsQd3FVDhX6lw7UjaJeUbrwgmfr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb0bda3-c997-4cef-38ed-08d90f97a316
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:30:20.2435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alfLM9zbaOH2U78OHUUwn6lP/kCM4O97JTDfPN5Vlt6RAr7Yzuoa3kqlY53qPnlV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1866
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
 Luben Tuikov <luben.tuikov@amd.com>, John Clements <john.clements@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVtb3ZlIHJlZHVuZGFudCByYXMtPnN1cHBvcnRlZCwgYXMgdGhpcyB2YWx1ZQppcyBhbHNvIHN0
b3JlZCBpbiBhZGV2LT5yYXNfZmVhdHVyZXMuCgpVc2UgYWRldi0+cmFzX2ZlYXR1cmVzLCBhcyB0
aGF0IHN1cGVyY2VkZXMgInJhcyIsCnNpbmNlIHRoZSBsYXR0ZXIgaXMgaXRzIG1lbWJlci4KClRo
ZSBkZXBlbmRlbmN5IGdvZXMgbGlrZSB0aGlzOgpyYXMgPD09IGFkZXYtPnJhc19mZWF0dXJlcyA8
PT0gaHdfc3VwcG9ydGVkLAphbmQgaXMgcmVhZCBhcyAicmFzIGRlcGVuZHMgb24gcmFzX2ZlYXR1
cmVzLCB3aGljaApkZXBlbmRzIG9uIGh3X3N1cHBvcnRlZC4iIFRoZSBhcnJvd3Mgc2hvdyB0aGUg
ZmxvdwpvZiBpbmZvcm1hdGlvbiwgaS5lLiB0aGUgZGVwZW5kZW5jeSB1cGRhdGUuCgoiaHdfc3Vw
cG9ydGVkIiBzaG91bGQgYWxzbyBsaXZlIGluICJhZGV2Ii4KCkNjOiBBbGV4YW5kZXIgRGV1Y2hl
ciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4KQ2M6IEpvaG4gQ2xlbWVudHMgPGpvaG4uY2xl
bWVudHNAYW1kLmNvbT4KQ2M6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogTHViZW4gVHVpa292IDxsdWJlbi50dWlrb3ZAYW1kLmNvbT4KQWNrZWQt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgICAgICAgICAgIHwgNiArKysr
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYyAgICAgICAgICAgICAg
fCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgICAgICAgICAg
ICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jICAgICAg
ICAgICAgICB8IDkgKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmggICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
b2MxNS5jICAgICAgICAgICAgICAgICAgIHwgNyArKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3Bvd2VycGxheS9od21nci92ZWdhMjBfYmFjby5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9zd3NtdS9zbXUxMS9zbXVfdjExXzAuYyAgICAgICB8IDMgKystCiA4IGZpbGVzIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCAzNTdmOTQwNWYxYWEuLjgwNjMxZjk5
OWZjZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAt
NTExMCw3ICs1MTEwLDggQEAgaW50IGFtZGdwdV9kZXZpY2VfYmFjb19lbnRlcihzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2KQogCWlmICghYW1kZ3B1X2RldmljZV9zdXBwb3J0c19iYWNvKGFkZXZfdG9f
ZHJtKGFkZXYpKSkKIAkJcmV0dXJuIC1FTk9UU1VQUDsKIAotCWlmIChyYXMgJiYgcmFzLT5zdXBw
b3J0ZWQgJiYgYWRldi0+bmJpby5mdW5jcy0+ZW5hYmxlX2Rvb3JiZWxsX2ludGVycnVwdCkKKwlp
ZiAocmFzICYmIGFkZXYtPnJhc19mZWF0dXJlcyAmJgorCSAgICBhZGV2LT5uYmlvLmZ1bmNzLT5l
bmFibGVfZG9vcmJlbGxfaW50ZXJydXB0KQogCQlhZGV2LT5uYmlvLmZ1bmNzLT5lbmFibGVfZG9v
cmJlbGxfaW50ZXJydXB0KGFkZXYsIGZhbHNlKTsKIAogCXJldHVybiBhbWRncHVfZHBtX2JhY29f
ZW50ZXIoYWRldik7CkBAIC01MTI5LDcgKzUxMzAsOCBAQCBpbnQgYW1kZ3B1X2RldmljZV9iYWNv
X2V4aXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0Owog
Ci0JaWYgKHJhcyAmJiByYXMtPnN1cHBvcnRlZCAmJiBhZGV2LT5uYmlvLmZ1bmNzLT5lbmFibGVf
ZG9vcmJlbGxfaW50ZXJydXB0KQorCWlmIChyYXMgJiYgYWRldi0+cmFzX2ZlYXR1cmVzICYmCisJ
ICAgIGFkZXYtPm5iaW8uZnVuY3MtPmVuYWJsZV9kb29yYmVsbF9pbnRlcnJ1cHQpCiAJCWFkZXYt
Pm5iaW8uZnVuY3MtPmVuYWJsZV9kb29yYmVsbF9pbnRlcnJ1cHQoYWRldiwgdHJ1ZSk7CiAKIAly
ZXR1cm4gMDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9r
bXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYwppbmRleCBhYmQ5
YmZhNDE5ZWEuLjAzMjdhYzQwMzQyMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9rbXMuYwpAQCAtMTAwNSw3ICsxMDA1LDcgQEAgaW50IGFtZGdwdV9pbmZvX2lvY3RsKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlscCkKIAog
CQlpZiAoIXJhcykKIAkJCXJldHVybiAtRUlOVkFMOwotCQlyYXNfbWFzayA9ICh1aW50NjRfdCly
YXMtPnN1cHBvcnRlZCA8PCAzMiB8IHJhcy0+ZmVhdHVyZXM7CisJCXJhc19tYXNrID0gKHVpbnQ2
NF90KWFkZXYtPnJhc19mZWF0dXJlcyA8PCAzMiB8IHJhcy0+ZmVhdHVyZXM7CiAKIAkJcmV0dXJu
IGNvcHlfdG9fdXNlcihvdXQsICZyYXNfbWFzaywKIAkJCQltaW5fdCh1NjQsIHNpemUsIHNpemVv
ZihyYXNfbWFzaykpKSA/CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcHNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKaW5k
ZXggMTdiNzI4ZDJjMWYyLi40ODg1YjcxOGNiNmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcHNwLmMKQEAgLTIxNDYsNyArMjE0Niw3IEBAIHN0YXRpYyBpbnQgcHNwX2xvYWRf
c211X2Z3KHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQogCQlyZXR1cm4gMDsKIAogCWlmICgoYW1k
Z3B1X2luX3Jlc2V0KGFkZXYpICYmCi0JICAgICByYXMgJiYgcmFzLT5zdXBwb3J0ZWQgJiYKKwkg
ICAgIHJhcyAmJiBhZGV2LT5yYXNfZmVhdHVyZXMgJiYKIAkgICAgIChhZGV2LT5hc2ljX3R5cGUg
PT0gQ0hJUF9BUkNUVVJVUyB8fAogCSAgICAgIGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1ZFR0Ey
MCkpIHx8CiAJICAgICAoYWRldi0+aW5fcnVucG0gJiYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yYXMuYwppbmRleCBlYmJlMmM1MTkwYzQuLmE0ODRhYzZhODM5OSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAtMjEzMCw5ICsyMTMwLDggQEAgc3Rh
dGljIHZvaWQgYW1kZ3B1X3Jhc19jaGVja19zdXBwb3J0ZWQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCiAJLyogaHdfc3VwcG9ydGVkIG5lZWRzIHRvIGJlIGFsaWduZWQgd2l0aCBSQVMgYmxv
Y2sgbWFzay4gKi8KIAkqaHdfc3VwcG9ydGVkICY9IEFNREdQVV9SQVNfQkxPQ0tfTUFTSzsKIAot
CSpzdXBwb3J0ZWQgPSBhbWRncHVfcmFzX2VuYWJsZSA9PSAwID8KLQkJCTAgOiAqaHdfc3VwcG9y
dGVkICYgYW1kZ3B1X3Jhc19tYXNrOwotCWFkZXYtPnJhc19mZWF0dXJlcyA9ICpzdXBwb3J0ZWQ7
CisJKnN1cHBvcnRlZCA9IGFtZGdwdV9yYXNfZW5hYmxlID09IDAgPyAwIDoKKwkJKmh3X3N1cHBv
cnRlZCAmIGFtZGdwdV9yYXNfbWFzazsKIH0KIAogaW50IGFtZGdwdV9yYXNfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKQEAgLTIxNTQsNyArMjE1Myw3IEBAIGludCBhbWRncHVfcmFz
X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJYW1kZ3B1X3Jhc19zZXRfY29udGV4
dChhZGV2LCBjb24pOwogCiAJYW1kZ3B1X3Jhc19jaGVja19zdXBwb3J0ZWQoYWRldiwgJmNvbi0+
aHdfc3VwcG9ydGVkLAotCQkJJmNvbi0+c3VwcG9ydGVkKTsKKwkJCQkgICAmYWRldi0+cmFzX2Zl
YXR1cmVzKTsKIAlpZiAoIWNvbi0+aHdfc3VwcG9ydGVkIHx8IChhZGV2LT5hc2ljX3R5cGUgPT0g
Q0hJUF9WRUdBMTApKSB7CiAJCS8qIHNldCBnZnggYmxvY2sgcmFzIGNvbnRleHQgZmVhdHVyZSBm
b3IgVkVHQTIwIEdhbWluZwogCQkgKiBzZW5kIHJhcyBkaXNhYmxlIGNtZCB0byByYXMgdGEgZHVy
aW5nIHJhcyBsYXRlIGluaXQuCkBAIC0yMjEwLDcgKzIyMDksNyBAQCBpbnQgYW1kZ3B1X3Jhc19p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiAJZGV2X2luZm8oYWRldi0+ZGV2LCAi
UkFTIElORk86IHJhcyBpbml0aWFsaXplZCBzdWNjZXNzZnVsbHksICIKIAkJCSJoYXJkd2FyZSBh
YmlsaXR5WyV4XSByYXNfbWFza1sleF1cbiIsCi0JCQljb24tPmh3X3N1cHBvcnRlZCwgY29uLT5z
dXBwb3J0ZWQpOworCQkJY29uLT5od19zdXBwb3J0ZWQsIGFkZXYtPnJhc19mZWF0dXJlcyk7CiAJ
cmV0dXJuIDA7CiByZWxlYXNlX2NvbjoKIAlhbWRncHVfcmFzX3NldF9jb250ZXh0KGFkZXYsIE5V
TEwpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCmluZGV4IDYwZGYyNjhh
MGM2Ni4uM2U4MzBkYzFhMzNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5oCkBAIC0zMTQsOCArMzE0LDYgQEAgc3RydWN0IGFtZGdwdV9yYXMgewogCS8qIHJhcyBpbmZy
YXN0cnVjdHVyZSAqLwogCS8qIGZvciByYXMgaXRzZWxmLiAqLwogCXVpbnQzMl90IGh3X3N1cHBv
cnRlZDsKLQkvKiBmb3IgSVAgdG8gY2hlY2sgaXRzIHJhcyBhYmlsaXR5LiAqLwotCXVpbnQzMl90
IHN1cHBvcnRlZDsKIAl1aW50MzJfdCBmZWF0dXJlczsKIAlzdHJ1Y3QgbGlzdF9oZWFkIGhlYWQ7
CiAJLyogc3lzZnMgKi8KQEAgLTQ3OCw3ICs0NzYsNyBAQCBzdGF0aWMgaW5saW5lIGludCBhbWRn
cHVfcmFzX2lzX3N1cHBvcnRlZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAogCWlmIChi
bG9jayA+PSBBTURHUFVfUkFTX0JMT0NLX0NPVU5UKQogCQlyZXR1cm4gMDsKLQlyZXR1cm4gcmFz
ICYmIChyYXMtPnN1cHBvcnRlZCAmICgxIDw8IGJsb2NrKSk7CisJcmV0dXJuIHJhcyAmJiAoYWRl
di0+cmFzX2ZlYXR1cmVzICYgKDEgPDwgYmxvY2spKTsKIH0KIAogaW50IGFtZGdwdV9yYXNfcmVj
b3ZlcnlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc29jMTUuYwppbmRleCAyOGU5ZjZiNzI2YTYuLjI5YzhlZTI2Nzk5MCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jCkBAIC02NTUsNyArNjU1LDcgQEAgc3RhdGljIGludCBzb2MxNV9h
c2ljX2JhY29fcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJaW50IHJldCA9IDA7
CiAKIAkvKiBhdm9pZCBOQklGIGdvdCBzdHVjayB3aGVuIGRvIFJBUyByZWNvdmVyeSBpbiBCQUNP
IHJlc2V0ICovCi0JaWYgKHJhcyAmJiByYXMtPnN1cHBvcnRlZCkKKwlpZiAocmFzICYmIGFkZXYt
PnJhc19mZWF0dXJlcykKIAkJYWRldi0+bmJpby5mdW5jcy0+ZW5hYmxlX2Rvb3JiZWxsX2ludGVy
cnVwdChhZGV2LCBmYWxzZSk7CiAKIAlyZXQgPSBhbWRncHVfZHBtX2JhY29fcmVzZXQoYWRldik7
CkBAIC02NjMsNyArNjYzLDcgQEAgc3RhdGljIGludCBzb2MxNV9hc2ljX2JhY29fcmVzZXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCXJldHVybiByZXQ7CiAKIAkvKiByZS1lbmFibGUg
ZG9vcmJlbGwgaW50ZXJydXB0IGFmdGVyIEJBQ08gZXhpdCAqLwotCWlmIChyYXMgJiYgcmFzLT5z
dXBwb3J0ZWQpCisJaWYgKHJhcyAmJiBhZGV2LT5yYXNfZmVhdHVyZXMpCiAJCWFkZXYtPm5iaW8u
ZnVuY3MtPmVuYWJsZV9kb29yYmVsbF9pbnRlcnJ1cHQoYWRldiwgdHJ1ZSk7CiAKIAlyZXR1cm4g
MDsKQEAgLTcxMCw3ICs3MTAsOCBAQCBzb2MxNV9hc2ljX3Jlc2V0X21ldGhvZChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKIAkJICogMS4gUE1GVyB2ZXJzaW9uID4gMHgyODQzMDA6IGFsbCBj
YXNlcyB1c2UgYmFjbwogCQkgKiAyLiBQTUZXIHZlcnNpb24gPD0gMHgyODQzMDA6IG9ubHkgc0dQ
VSB3L28gUkFTIHVzZSBiYWNvCiAJCSAqLwotCQlpZiAoKHJhcyAmJiByYXMtPnN1cHBvcnRlZCkg
JiYgYWRldi0+cG0uZndfdmVyc2lvbiA8PSAweDI4MzQwMCkKKwkJaWYgKHJhcyAmJiBhZGV2LT5y
YXNfZmVhdHVyZXMgJiYKKwkJICAgIGFkZXYtPnBtLmZ3X3ZlcnNpb24gPD0gMHgyODM0MDApCiAJ
CQliYWNvX3Jlc2V0ID0gZmFsc2U7CiAJCWJyZWFrOwogCWNhc2UgQ0hJUF9BTERFQkFSQU46CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdhMjBf
YmFjby5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2Jh
Y28uYwppbmRleCAyYTI4YzlkZjE1YTAuLmY2YjFlZmNlNDUwYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2JhY28uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdhMjBfYmFjby5jCkBAIC04NSw3
ICs4NSw3IEBAIGludCB2ZWdhMjBfYmFjb19zZXRfc3RhdGUoc3RydWN0IHBwX2h3bWdyICpod21n
ciwgZW51bSBCQUNPX1NUQVRFIHN0YXRlKQogCQlyZXR1cm4gMDsKIAogCWlmIChzdGF0ZSA9PSBC
QUNPX1NUQVRFX0lOKSB7Ci0JCWlmICghcmFzIHx8ICFyYXMtPnN1cHBvcnRlZCkgeworCQlpZiAo
IXJhcyB8fCAhYWRldi0+cmFzX2ZlYXR1cmVzKSB7CiAJCQlkYXRhID0gUlJFRzMyX1NPQzE1KFRI
TSwgMCwgbW1USE1fQkFDT19DTlRMKTsKIAkJCWRhdGEgfD0gMHg4MDAwMDAwMDsKIAkJCVdSRUcz
Ml9TT0MxNShUSE0sIDAsIG1tVEhNX0JBQ09fQ05UTCwgZGF0YSk7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3NtdV92MTFfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wbS9zd3NtdS9zbXUxMS9zbXVfdjExXzAuYwppbmRleCA2Mjc0Y2FlNGEwNjUuLjcy
NTgxZTQzZDgzZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUx
MS9zbXVfdjExXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3Nt
dV92MTFfMC5jCkBAIC0xNTMxLDcgKzE1MzEsOCBAQCBpbnQgc211X3YxMV8wX2JhY29fc2V0X3N0
YXRlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9iYWNvX3N0YXRlIHN0YXRlKQog
CQkJCQkJCQkgICAgICBOVUxMKTsKIAkJCWJyZWFrOwogCQlkZWZhdWx0OgotCQkJaWYgKCFyYXMg
fHwgIXJhcy0+c3VwcG9ydGVkIHx8IGFkZXYtPmdtYy54Z21pLnBlbmRpbmdfcmVzZXQpIHsKKwkJ
CWlmICghcmFzIHx8ICFhZGV2LT5yYXNfZmVhdHVyZXMgfHwKKwkJCSAgICBhZGV2LT5nbWMueGdt
aS5wZW5kaW5nX3Jlc2V0KSB7CiAJCQkJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX0FSQ1RV
UlVTKSB7CiAJCQkJCWRhdGEgPSBSUkVHMzJfU09DMTUoVEhNLCAwLCBtbVRITV9CQUNPX0NOVExf
QVJDVCk7CiAJCQkJCWRhdGEgfD0gMHg4MDAwMDAwMDsKLS0gCjIuMzEuMC45Ny5nMTQyNDMwMzM4
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
