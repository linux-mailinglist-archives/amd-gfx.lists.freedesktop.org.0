Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C34A6379419
	for <lists+amd-gfx@lfdr.de>; Mon, 10 May 2021 18:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAB26E8B8;
	Mon, 10 May 2021 16:36:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B89C6E8AD;
 Mon, 10 May 2021 16:36:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DY0+Pxbnuj+jRO5JeW71jQVuQsWzUk6njv3luA+k0/kLdytnhtqfTEqRZyk5HLltrmaj7t8mnAbfdeHBW8ekif0SMtPLRxglYuiNR/3uBzVlJRc/qCu4RknJeOxlH/QlZkgWKtEG4EmNHAyPizibrYwFmEl0sk+2aBLEIwkRHVmMeJe3/lLJnt1xq2NKsN69P4ox3575YNl5ccOscnXiZ2/Wfz5bUErHn/San51o67LMIVPss/3qdCUk7SR40j6sAAudcnR2XeQnArlQmfDujSpvDP9IcqjeWlQzIFdZah+zpNvbjyo3OXOd1/WRfrltvT5Ubt7RLmtNHK/ypY0ZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImiQhpPoXfItMc84rz4U+sl7ukQBW3gycLm8/fXkr9o=;
 b=FVkfI/ZvATN/g8uXINeVRxzj1XMLglvQ3hjQQ5eSpDhlxFIDkjQauDCu4u3jNaJeM6QWeL1dq1oJ6x9zQGJaM809Wlu9t8syDPXMTt5ZLs2an1Lgo6ZPSm/EPOu+ogEo+t8OZ090so2Stqn2YiA4Bae+kje/t5BdPg70f72PGs+GXHfX9Tjtbx0kgucajLppYCVSZ+73WvQZLBA159aEycKmMrpF45orbp7EJeqBigJ3WKv0bbIoGwZlokeougqsdcNTVe1g1hc9UlmH4HQroGPdLJpyjsRc0AiV4jWhe0wenQL7tQGUqqriTjBJya25RULAP4d4ZHWFVUc3Cfm13w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImiQhpPoXfItMc84rz4U+sl7ukQBW3gycLm8/fXkr9o=;
 b=QvX5zpMwKJS7tM33SuWHN5dgn4f9sHuvaFU0paoYM3fi9C+YinJGg0g6wdW4yvXjbysnMB2uo1bwuI7zFeXNamy38XFb9Yk3UcK0KkGNV8vueUtE8LaXi/a/7foIdX3v2V+wPjMYdES0u2NPbQ4NjcNKttKcUGqdUy84Is1R7MY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 16:36:54 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:36:54 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 07/16] drm/amdgpu: Remap all page faults to per process
 dummy page.
Date: Mon, 10 May 2021 12:36:16 -0400
Message-Id: <20210510163625.407105-8-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:36:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f7cca66-b0cd-4978-2a5e-08d913d1d204
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44627377E440FD173A1C7905EA549@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TyrhCVAyZhOiuh1JFseEDpL96lsuEALzha62o53XF1TZIS9fz05CKHqPO/w7S2rMGdiKbT4nBlnQH6XkQYoQ+l3aKSvD8XVeERoAN9CGXgvToUoFN9vbIkrBY7SANrORlNySyQXOZEx93BTMMyoCrZK++AVE3Mur8cWvy+SWR5R7xdHP+x/y31kABsMJA73hTMHct6RMd6fUvqqToLAGpskQAijKLJHIr3XhmqeYLsQJWtJkIX/mUN3dbNWme40kEnJf1YIiXpiVYTLfhZ47b5Vlfqk1jvgFQd0Z8+LG4oZAIGiORdtluKMzAFBHCRtq8P2C/uPM2vkOu1ybtaJkc+WieG9QbGOdTxJ+4tSC5BzNXr6XjgfV0NN6QzCG7rlCHFS9KXwNBKWb9zDYCvb4RabS5rNkkNPgi5kYW5/5kai3QmBRPR9oxqPR7LhuaVhS6MNyRsoNPvHuF+EV6fs0+VYtjIM/3+tJccWPK9nGMtj7pZvnTjenGUKLgVJTF5mk3C9yGz6+g4vN87YceLDEh8Gwmxm+0Q8tWhbJ8YQIC1Kzxe7l7FcMV9pvFRNNU+eQnjP30G6G4+9Iva3LQJN80W6n0aXMSWyGL2vvLOg0D0c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(86362001)(6506007)(38100700002)(52116002)(6666004)(44832011)(8676002)(36756003)(5660300002)(478600001)(8936002)(2906002)(6486002)(54906003)(66946007)(2616005)(66476007)(66556008)(1076003)(316002)(6636002)(6512007)(16526019)(186003)(83380400001)(4326008)(66574015);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2xjR2tIMXF4M3JCM0Z3SmVuRkFJRnRvcFc1VzRiaDRkWGlYWjlNeG14c0Zs?=
 =?utf-8?B?ZGlJdERQWlczRzlGdy9UalQ3TW5MQk5VaktJSW9sSXhhWDZaUlFEYlY3Vjdz?=
 =?utf-8?B?aXdEWnFEaUdlOGQ3aUxBcFhuQ3Q5YVlxbEVINzJKa2grN1o0bWFnbEh2ek1i?=
 =?utf-8?B?VG8walJFclJRVUdpSDh1VDJsckJaMFFBRGxyb1doVzk5Z1NsV081WWJWWHlR?=
 =?utf-8?B?S2YvWUZLZlFKNzhMTnB3b3dKV0tkK3BpM3FmUkh2QzdscFNaM3B3Nmlsd04v?=
 =?utf-8?B?SkREZXlyTXdjTjEvaWwrY1BMWjhjL3hLTVR3YmpSZWJVdStKYkJ2WC9Hd2da?=
 =?utf-8?B?VndGV1JxZVNicDU2empiTWZFU25MQkNqSVNrQ0NRbmxEenRPOUNhZHgrcDRR?=
 =?utf-8?B?ajJ4L3lFWHU2elp2OWlKVk94Um1kcG1oamVEb0I2Z2l2NGJQTHdpMUc1STNx?=
 =?utf-8?B?aG1sT2ZaZVFMSWJzdStIbHVMSGlpYzJiZW04aVJ1aTh1VFp5MGdGbkR5V0do?=
 =?utf-8?B?cVV4eUFoZmNwRytiWXZpRzY0UXpoM3c5VTMvK0thRCtsUGVMeFdMUURkZWpp?=
 =?utf-8?B?a0ZUL0ovcWNZWTBYSTMwZm1ENWtBTUdQa2tpakFva2ZEWjZmK3FrMVNHMitq?=
 =?utf-8?B?WVU3Vm00ZDlQZTlrT2x6azlBT3Urb2REUHYyT1R6MHQ4Z2dUWFJrT0gzNzlp?=
 =?utf-8?B?eXFLR2NMSmEyQjZBMzI4Q1NUaEpzY1V1TnN1ejFHMVF1MEhRZE04aE5rN1dI?=
 =?utf-8?B?MjdiajBqWTVJQW9nK3owTWxoVjMxcmgwYU45cEtEeG5FRkhwQ3JudG4rbnF3?=
 =?utf-8?B?YnhGNlpvUHF5T3huY1ExN01mdThWTWNqbmNZZVFBMHF0VmhaVE9yWDgrOC9B?=
 =?utf-8?B?UjVaVlEwZnlEQ3N4OEhiYi9FUEU5M3BvUTQ3a1RiYWpMK3l3UUFvV0xIemlE?=
 =?utf-8?B?V2FOeTMrdGlJS1puSjFybGFiN3hHdm9MbUsrQXJTY3Y2ZXdSYzd3dU5Rc2hT?=
 =?utf-8?B?VkRmSnhzaFJEZDdheDhOS3hFWkFTM2V0cGNObVBMcU5vZVJFWFZmU1Vqd3Ar?=
 =?utf-8?B?RnJBUFRTVUlWY1JCUXdWR0V5WEl1WEFHTVBESy8rbGxMd2dONW1MTG81SGR0?=
 =?utf-8?B?NDBDSnQza09sWUNCZjZSMy85L3dwdHpqa0JWY1VpRjdyWUl0OXBIcjhRQzlV?=
 =?utf-8?B?dkUxNkVhTHJENWpaanlQY0pDSWV0bnRsRnhzT1JYa3huZUxpVU05YlZ5cUZD?=
 =?utf-8?B?bjdMWW5teGl2N1RWdjBOM2U4bGtBSGxsdGlzSEhOVHMxSmppdHpSZkVxQzVY?=
 =?utf-8?B?MEo5dlc5dXdwSUhpRW11Q3MxQVkvY1VZZURxZGFqQXZ1OEdXLytSSUhBeXBl?=
 =?utf-8?B?c25XN1puNEV5dVJ2cnp0SzFUQ3JXTCtheTREQ21hRDZ1SzVGbUxvNThuMEwv?=
 =?utf-8?B?VnRLd3ZPNy9HL3BlYUpBRHZNR2Fzb2l4NFpxQzNZam9HMW9mYlczanF6cW1v?=
 =?utf-8?B?QkRtN1B5c3NLQndsM3YzN3d4STB5cVdsT2N5QWw3cEhObFZtZWNZbWdseEFQ?=
 =?utf-8?B?MXFaY0R3dmNScHdXR2psN3ZvTnFRTFg2SHN0bitRQjRRcWhhT3YxRkMvSG94?=
 =?utf-8?B?dEhRYkFWMG1xZHFIV1pGQzV2U1BYSEFMVFkyaXdMQ1RDRmlxbUNVdFo2OSt3?=
 =?utf-8?B?UDRLUmk3WDB2R2JkZlg3QlBCWWV0TmIxWEhiSTM3cWpjTi9aSGJ3WEsvK212?=
 =?utf-8?B?K2dUU25iSnE3dTBDUFpCemRzdEthcnJmKzI4bUlhbTQ4Y0Q5anBFcE1kMTl0?=
 =?utf-8?B?Zk5Ddk44UXhJQkhPVjQrUWYwTlVjSngzTGtpVjY5WDNTS3BuTFpqZHR1T0cx?=
 =?utf-8?Q?T6wumU1K+jlPt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7cca66-b0cd-4978-2a5e-08d913d1d204
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:36:54.3576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VS9pumjICUHa4+Ie6QsUhWCdFqtGW7OD4ZFxNvJzxjjbZ8RTEZPL99ybOfGKTjc3TYxx18MarfkiEmvWsWa7qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, gregkh@linuxfoundation.org,
 Felix.Kuehling@amd.com, ppaalanen@gmail.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gZGV2aWNlIHJlbW92YWwgcmVyb3V0ZSBhbGwgQ1BVIG1hcHBpbmdzIHRvIGR1bW15IHBhZ2UK
cGVyIGRybV9maWxlIGluc3RhbmNlIG9yIGltcG9ydGVkIEdFTSBvYmplY3QuCgp2NDoKVXBkYXRl
IGZvciBtb2RpZmllZCB0dG1fYm9fdm1fZHVtbXlfcGFnZQoKU2lnbmVkLW9mZi1ieTogQW5kcmV5
IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMjEgKysrKysrKysrKysrKysrKy0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKaW5kZXggOGM3ZWMwOWViMWE0Li4wZDU0ZTcw
Mjc4Y2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKQEAgLTQ4LDYg
KzQ4LDcgQEAKICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9wbGFjZW1lbnQuaD4KIAogI2luY2x1ZGUg
PGRybS9hbWRncHVfZHJtLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KIAogI2luY2x1ZGUg
ImFtZGdwdS5oIgogI2luY2x1ZGUgImFtZGdwdV9vYmplY3QuaCIKQEAgLTE5MDUsMTggKzE5MDYs
MjggQEAgdm9pZCBhbWRncHVfdHRtX3NldF9idWZmZXJfZnVuY3Nfc3RhdHVzKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LCBib29sIGVuYWJsZSkKIHN0YXRpYyB2bV9mYXVsdF90IGFtZGdwdV90
dG1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiB7CiAJc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibyA9IHZtZi0+dm1hLT52bV9wcml2YXRlX2RhdGE7CisJc3RydWN0IGRybV9kZXZpY2Ug
KmRkZXYgPSBiby0+YmFzZS5kZXY7CiAJdm1fZmF1bHRfdCByZXQ7CisJaW50IGlkeDsKIAogCXJl
dCA9IHR0bV9ib192bV9yZXNlcnZlKGJvLCB2bWYpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7
CiAKLQlyZXQgPSBhbWRncHVfYm9fZmF1bHRfcmVzZXJ2ZV9ub3RpZnkoYm8pOwotCWlmIChyZXQp
Ci0JCWdvdG8gdW5sb2NrOworCWlmIChkcm1fZGV2X2VudGVyKGRkZXYsICZpZHgpKSB7CisJCXJl
dCA9IGFtZGdwdV9ib19mYXVsdF9yZXNlcnZlX25vdGlmeShibyk7CisJCWlmIChyZXQpIHsKKwkJ
CWRybV9kZXZfZXhpdChpZHgpOworCQkJZ290byB1bmxvY2s7CisJCX0KIAotCXJldCA9IHR0bV9i
b192bV9mYXVsdF9yZXNlcnZlZCh2bWYsIHZtZi0+dm1hLT52bV9wYWdlX3Byb3QsCi0JCQkJICAg
ICAgIFRUTV9CT19WTV9OVU1fUFJFRkFVTFQsIDEpOworCQkgcmV0ID0gdHRtX2JvX3ZtX2ZhdWx0
X3Jlc2VydmVkKHZtZiwgdm1mLT52bWEtPnZtX3BhZ2VfcHJvdCwKKwkJCQkJCVRUTV9CT19WTV9O
VU1fUFJFRkFVTFQsIDEpOworCisJCSBkcm1fZGV2X2V4aXQoaWR4KTsKKwl9IGVsc2UgeworCQly
ZXQgPSB0dG1fYm9fdm1fZHVtbXlfcGFnZSh2bWYsIHZtZi0+dm1hLT52bV9wYWdlX3Byb3QpOwor
CX0KIAlpZiAocmV0ID09IFZNX0ZBVUxUX1JFVFJZICYmICEodm1mLT5mbGFncyAmIEZBVUxUX0ZM
QUdfUkVUUllfTk9XQUlUKSkKIAkJcmV0dXJuIHJldDsKIAotLSAKMi4yNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
