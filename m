Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2642C3AF795
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Jun 2021 23:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBD96E426;
	Mon, 21 Jun 2021 21:41:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE57C6E423;
 Mon, 21 Jun 2021 21:41:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibLmwseHFXQoQEmo/Oqsc7/QILriKjXfeusRXoTtE2TnhewKObnz3DCjxNg390wwdF+I5/ks32PSRKYiFZe6V9BJqZ2WH+Rmp96gc3PDlyKE/4HlLPGb3Q20fmNH7z9Vq3IMW4AuteNKWmdY3Bh5YOF03yBXWHLmfn3JEEDT+lJE+yGCy9NW8tiA89whj8FDDH9Moivxyj0tn5PTunuBGCZ3QCqZ5T9NPK+/d5JAbAcwRfpXH0tqkfuJ/3inL1FvylQgcTWNoTh7jCO7m5VVEc1zqawTKTrNB2jy/1l3JkMqn9kyN7UQ7hrx8dRHlg3IiAYKHy/b3911G4j3tjde8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4PetVJXcHSyEZ6VgIfsHjAs1iYQ96uCM/uvas0IQ/o=;
 b=UpK+9hTGLTLI67HHNmvnLtjwru62kWuDz0hjsh7jP80JnXWha6vlpnU1f2VLzElGV8cAlpBPRFsJSd91/yArDevYDpdN0jDImSOj3HuYwHmcwfK5zCcrJZu9/gvBe9gzaF8Hn7ca2T4nFgc+ThXCd05pJIna9ptzMiQ9CSVexBUd5fwT+ViRr9PSZ2lefgPBLgoj6MBcCnKmwL6ZetNtyZIvndiFflCx/uyQakZCetF/8R3UrNGTJd9hvQc/H7BXXfcrO7blzElTDWmX2G0ZntFBVRZSLOv20nJA1de6qyGLbA4KVa7yqKrKcgkbdmrIPeeWF9WTLi6/aI3dpxayOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4PetVJXcHSyEZ6VgIfsHjAs1iYQ96uCM/uvas0IQ/o=;
 b=uiuRJIbZAWdZP5EMrpfn+gdiwoN1oQHIIlvc4LczlLQ39AywecChWyRL5pYw185vPZcsFw2IyYLZ2qvRPyLMT25M76nfyILvY2nje6E8Zw5wl5ZDAv8NCj3kXZ/RxYIpzy254NgFbilINuVoMk+83fEkZFG1deFe20vsHMBzts4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL0PR12MB5538.namprd12.prod.outlook.com (2603:10b6:208:1c9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Mon, 21 Jun
 2021 21:41:49 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::3c38:805a:5664:9047]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::3c38:805a:5664:9047%3]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 21:41:49 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.13
Date: Mon, 21 Jun 2021 17:41:32 -0400
Message-Id: <20210621214132.4004-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [192.161.79.207]
X-ClientProxiedBy: MN2PR22CA0013.namprd22.prod.outlook.com
 (2603:10b6:208:238::18) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.207) by
 MN2PR22CA0013.namprd22.prod.outlook.com (2603:10b6:208:238::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Mon, 21 Jun 2021 21:41:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c79fb2aa-d5a4-4310-33e4-08d934fd6027
X-MS-TrafficTypeDiagnostic: BL0PR12MB5538:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB55389DFE9F2E4F745F36F947F70A9@BL0PR12MB5538.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 457nH1w3fyBaIUQ6IaTvvvcvWZx3Zr/xDBWtcdSw27y2Qrq46/fQfldViOw8VTs67rsByGDEFutTWFPO7HoENZr3AIeo0cB3C48E7Bk9lpJr44w01YKvwGipVm44AqwjqQRfaF4HWQnNYUhx7F/XA369KNpeYVfyT2I5dGxlbVS+Whs5D7GoTDDBOUiHlLE5/yVMW+J0aQJvWRytuwyUNIEnu1YPxGaxeBtJHuG/cXTwTk7VW5Q6oPPS6e6kcMF5Mr5MUbYR11zCF9VAmI/f/f0qfhiwqU50D7FfBR0fv44UgdBhOn1mrCdDJ7R8almLXwEInpdB9R3D2o/Dmx7GuVBwAf5SexOat7721KW7Hjyc+9agIqQacArxe8CIcSgW3HZYZN+zeXWDItGFKeagrUauZ7LPUOM7GL7cHckv3sJNpUJ4c5mze9sqqwbDrSqsawP0Jisq5AXJ3iCGLNtp8bgES02WDgsXnLPS690l2JlLbJDnZI48/p8m6RqZ7UQawe44sem9aqtAHd1zwmhKO72Da4fDMNUXTMOVDdhnNwBRj9H9YCuoC2xZrqbhBhr2QD7Bx1JqYVZcjvDw4HmYaUuKXvzca/KqAY5ExYABTcldGvHonYOY2GVJ+1ObF8QsCLVnoHSrC15x1/9HYs76imhRmSPforMfkY+Rh5Go3q3OB00qk03yJwA0avs7mxKd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(52116002)(316002)(478600001)(83380400001)(86362001)(6486002)(8936002)(956004)(38100700002)(2906002)(4326008)(6666004)(66476007)(66556008)(26005)(966005)(66946007)(5660300002)(6506007)(38350700002)(2616005)(1076003)(186003)(36756003)(16526019)(6512007)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXUxczJNZnE1V29NQlZBdjRHT2U5MGJ0YisyYjF0SnNEeDlWWi9NU0U5UDJn?=
 =?utf-8?B?L1FVc3I1cW84UlJ3NHIwZzRKZkxROVVTLyswWnBDbTRLeXRReWZhd1AwT2tl?=
 =?utf-8?B?VDNkL2tZNDNHa0h6WnRUSjBXczRNNW5TdTFEanZUZGdDOGIvb1Exem1FVU51?=
 =?utf-8?B?aGZxR2E2c2liejZZUkQyNXFxK2VqblRaRnFIV0xaYW4rZWd4Z1pwaDlZWXlO?=
 =?utf-8?B?b1ZRQ1RkOWxVOVFJOHZDSG83VzFKT3BveEdmMGdLcEU5UWN2OTFBZG9oaEo4?=
 =?utf-8?B?VHhDSHlhczJHSEl4R0k4bUZtUHlVMnNNT0JPQnBKMTIxQnJ2czZjWVV3YlBL?=
 =?utf-8?B?VXdjQ25yUUhqM0J2RVV2aEFQQjR2VnVXajhGL1dsUnRkajRROXpPR1grZTN5?=
 =?utf-8?B?TG9OdUlXRmlIajFYRy82WVJJNXE5dU5NRkpCaDlkdjNCTEg1Vzl2M1NERXpL?=
 =?utf-8?B?M0VDRGNKb1Z0QkpkOHVmMGhxY2dMeHA0N0ZZWUxjZUNZM1VUUEhGWURXWkZa?=
 =?utf-8?B?U1B1T0tXVk1SdkZBWHVkY0J3RkJOYXA4NG1rV04rczA3ZGxHQjBDOVdKYjZu?=
 =?utf-8?B?VzZTR3NoVXEvcWFXQjI0WVdzYWxvSkVmTi83anBjdzNCck4xNkdvMkFVTk8x?=
 =?utf-8?B?RjF6S0FCQkM1YUFiUmk4UFg3czNTYXFMRXpzclpCN3NaL0MrRUUrNjdvQmIw?=
 =?utf-8?B?VFNtQURHQzJodVU4NjZvMjlIV0padlF3bldUUkpMRUVoMTJ3MnBRejBaTnJv?=
 =?utf-8?B?K1B2QzRiWFZhYkJIQXV6c3NGUHJDWFp5SjFKSXh1UDBQZnoxdGE2d0QwVC9Y?=
 =?utf-8?B?elV0N25Ddk44cGNvdjMzQ0gwSDZYUU5SZzdTcUtEVlRFY3doSGM0WGx5VjAv?=
 =?utf-8?B?UFZuMmxRMG5NTDhWQUxIaHczOHhweDY4Y095cGprdHZIUXBVNFFWS2kzOG56?=
 =?utf-8?B?bTNVN2pvMER3VE02c1NXdWl2RVB2V0MydDU2ay9CaU9oTEgxQXBnaHpFQndh?=
 =?utf-8?B?M2g2elN1TWNhaWwwU0tDQU5DeGd6MlZteS9HZE1lUHVPZ0dXQWRZSk95ZGt3?=
 =?utf-8?B?eHRUeXJDbmNRMGdlYkZZWWQ1S29GTW1BMmo3aHpERUhXUHpDd1FLRGxWb0Yv?=
 =?utf-8?B?V0txcFg0S3hQYXcrZlBYKzF5NE1RdE1vU1JWM1pxVTFhVXJ2M2NpTFZhZEZu?=
 =?utf-8?B?M1lKOFpxY1JrQWJaK1p4SFdteC9zZ3hIc0dUeThuUzN3V1F0RTJ1RGh1Rm1T?=
 =?utf-8?B?ajdmdnBWV1dVY0hqcnpwMVRIVGcxZUpnaU5MTUFiODJSVnI4ZWppOE9uMmZW?=
 =?utf-8?B?K1ZpYXBzYTNtcU9SYU04WGt6UDJZL0F5bXNya1ppM29XaXFmaEkzSmNUQ0lu?=
 =?utf-8?B?VkJvMVZoNFJIVkVlRXU4MERqa2dTelNxamljMWQrVGlnK2MzWENJclI1dWU0?=
 =?utf-8?B?aXpYcHZROVU4UFNPZTBNbnpPeXRTUSthcUpheEQ5bVNNQnBwRVlCenBWd0lL?=
 =?utf-8?B?Y0o3Um5kUkVjYU1nSWU3cGRPMlNjWVhqWmMyYWxDUDF4VkxIWUZabFRrTVp0?=
 =?utf-8?B?ZG1ETHJ2aVpoV2FqYjdUOGFNT0FRSjNoQ1g5dUZBc0pMYzY3SG9xTE8zaGdN?=
 =?utf-8?B?cHNiM0NTNUVpcFh0N2RWNHZsUTdhV2VEdDRkQ1BMbjIxbmxBUGNaL0piYmpy?=
 =?utf-8?B?NEIvNmpZMEVQWlIxVDMrTXg2aHpmdk44WDE1K3RTQXh0UWFpd0Ewa0xGYVYw?=
 =?utf-8?Q?EnK6p8/6V5dNjBG5rnPa3fGvG6k42Y8MgSAb1JO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c79fb2aa-d5a4-4310-33e4-08d934fd6027
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 21:41:49.5502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHTvnRH10igjo8LKEugAk6mvbpJHA5Cm9Cygcd9fi2o98JDsvDoUFThw4PblgB81WxVGsFn/0GRIbwUdVLvFvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5538
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKTGFzdCBtaW51dGUgZml4ZXMgZm9yIDUuMTMuCgpUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDEzMzExZTc0MjUzZmU2NDMyOTM5MGRmODBiZWQzZjA3
MzE0ZGRkNjE6CgogIExpbnV4IDUuMTMtcmM3ICgyMDIxLTA2LTIwIDE1OjAzOjE1IC0wNzAwKQoK
YXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9hZ2Q1Zi9saW51eC5naXQgdGFncy9hbWQtZHJtLWZpeGVzLTUuMTMt
MjAyMS0wNi0yMQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGVlNTQ2OGI5ZjFkM2Jm
NDgwODJlZWQzNTFkYWNlMTQ1OThlOGNhMzk6CgogIFJldmVydCAiZHJtL2FtZGdwdS9nZng5OiBm
aXggdGhlIGRvb3JiZWxsIG1pc3Npbmcgd2hlbiBpbiBDR1BHIGlzc3VlLiIgKDIwMjEtMDYtMjEg
MTc6MjI6NTIgLTA0MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmFtZC1kcm0tZml4ZXMtNS4xMy0yMDIxLTA2LTIxOgoK
YW1kZ3B1OgotIFJldmVydCBHRlg5LCAxMCBkb29yYmVsbCBmaXhlcywgd2UganVzdAogIGVuZCB1
cCB0cmFkaW5nIG9uZSBidWcgZm9yIGFub3RoZXIKLSBQb3RlbnRpYWwgbWVtb3J5IGNvcnJ1cHRp
b24gZml4IGluIGZyYW1lYnVmZmVyIGhhbmRsaW5nCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1pY2hlbCBEw6RuemVyICgx
KToKICAgICAgZHJtL2FtZGdwdTogQ2FsbCBkcm1fZnJhbWVidWZmZXJfaW5pdCBsYXN0IGZvciBm
cmFtZWJ1ZmZlciBpbml0CgpZaWZhbiBaaGFuZyAoMik6CiAgICAgIFJldmVydCAiZHJtL2FtZGdw
dS9nZngxMDogZW5sYXJnZSBDUF9NRUNfRE9PUkJFTExfUkFOR0VfVVBQRVIgdG8gY292ZXIgZnVs
bCBkb29yYmVsbC4iCiAgICAgIFJldmVydCAiZHJtL2FtZGdwdS9nZng5OiBmaXggdGhlIGRvb3Ji
ZWxsIG1pc3Npbmcgd2hlbiBpbiBDR1BHIGlzc3VlLiIKCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGlzcGxheS5jIHwgMTIgKysrKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjEwXzAuYyAgICAgIHwgIDYgKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgICAgIHwgIDYgKy0tLS0tCiAzIGZpbGVzIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeAo=
